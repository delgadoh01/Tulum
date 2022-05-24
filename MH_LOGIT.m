function [Beta_draws,ME1,ME2] = MH_LOGIT(Y, X, ndraws, burn_in)

% Purpose: 
% Bayesian Estimate of the Logit model and the marginal effects
% -----------------------------------
% Model:
% Yi* = Xi * Beta + ui , where ui ~ standard logistic distribution
% Yi* is unobservable. 
% If Yi* > 0, we observe Yi = 1; If Yi* <= 0, we observe Yi = 0
% -----------------------------------
% Algorithm: 
% Proper prior Beta ~ N(mu,V). 
% Metropolis Hasting  sampling of posterior Beta
% -----------------------------------
% Usage:
% Y = dependent variable (n * 1 vector)
% X = regressors (n * k matrix)
% ndraws = number of draws in MCMC
% burn_in = number of burn-in draws in MCMC
% -----------------------------------
% Returns:
% Beta_draws = posterior draws of coefficients corresponding to the k regressors
% ME1 = marginal effects (average data)
% ME2 = marginal effects (individual average)
% 
% Written by Hang Qian, Iowa State University
% Contact me:  matlabist@gmail.com


if nargin < 2;    error('Incomplete data.');      end
if nargin < 3;    ndraws = 10000;                                          end
if nargin < 4;    burn_in = ndraws * 0.5;                                  end

[nrow_x,ncol_x] = size(X);
[nrow_y,ncol_y] = size(Y);
if nrow_x < ncol_x;    X = X';    ncol_x = nrow_x;end
if nrow_y < ncol_y;    Y = Y';    ncol_y = nrow_y;end
if ncol_x < ncol_y;    Y_temp = Y;    Y = X;    X = Y_temp;end

[nobs,nreg] = size(X);

Y_unique = unique(Y);
if length(Y_unique) ~= 2
    disp('Ooopse, dependent variable should be binary.');
    disp('For illustration purpose, Y are grouped to binary data by its mean value')
end
Y = (Y > mean(Y));


add_const = 0;
const_check = all(X==1);
if ~any(const_check)
    disp('A constant terms is added to X due to normalization. ')
    X = [ones(nobs,1),X];
    nreg = nreg + 1;
    const_check = [true,const_check];
    add_const = 1;
end



%----------------------------------------
% Prior distribution settings
%  Beta ~ N(mu,V)
% You may change the hyperparameters here if needed

prior_mu = zeros(nreg,1);
prior_V = 100 * eye(nreg);
%-----------------------------------------



Beta_draws = zeros(nreg,ndraws-burn_in);
Beta_use = (X' * X) \ (X' * Y);
prior_V_inv = inv(prior_V);
try
    options = optimset('LargeScale','off', 'Display','off'); 
    [Beta_use,fval,exitflag,output,grad,Hessian] = fminunc( @(c) -post_density(c,Y,X,prior_mu,prior_V_inv) , Beta_use, options);
    Beta_use = Beta_use .* (1+randn(nreg,1)/5);
    jump_V = inv(Hessian);
catch
    Beta_use = prior_mu + chol(prior_V)' * randn(nreg,1);
    jump_V = eye(nreg);
end

jump_chol = chol(jump_V,'lower');
previous_pdf_log = post_density(Beta_use,Y,X,prior_mu,prior_V_inv);



H_status_bar = waitbar(0,'MCMC in progress   0%');
percentage = floor(ndraws/100);
update_schedule = burn_in + floor(ndraws/5);
success_lower = 0.15;
success_upper = 0.35;
success = 0;

r = 1;
while r <= ndraws
            
    if mod(r,percentage)==0
        waitbar(r/ndraws,H_status_bar,['MCMC in progress   ',num2str(floor(r/ndraws*100)),'%']);
    end
    
   if r == update_schedule && (success/r<success_lower || success/r>success_upper)
        disp(' ')
        disp(['Test: Ratio of successful jumps:  ',num2str(floor(success/r*100)),'%'])
        disp(['The tageted ratio band is ',num2str(success_lower*100),' % ',num2str(success_upper*100), ' %'])        
        jump_V = cov(Beta_draws(:,1:update_schedule - burn_in-1)');
        try
            jump_chol = chol(jump_V,'lower');
            r = 1;
            success = 0;
            disp('The jump density is inappropriate, restart the sampler now.')
        catch
            disp('Unable to update the covariance matrix of the jump density.');
            disp('The MCMC will proceed, but the chain may or may not mix well.')
        end               
   end
   

    cand = Beta_use + jump_chol * randn(nreg,1);
    current_pdf_log = post_density(cand,Y,X,prior_mu,prior_V_inv);
    %previous_pdf_log = post_density(Beta_use,Y,X,prior_mu,prior_V_inv);
    if exp(current_pdf_log - previous_pdf_log) > rand
        Beta_use = cand;
        success = success+1;
        previous_pdf_log = current_pdf_log;
    end
       
       
    if r > burn_in        
        Beta_draws(:, r - burn_in) = Beta_use;        
    end
    
    r = r + 1;
    
end

disp('M-H sampling finished.')
disp(['Ratio of successful jumps: ',num2str(floor(success/ndraws*100)),'%'])


Beta_mean = mean(Beta_draws,2);
Beta_std = std(Beta_draws,0,2);

logit_F = 1./(1 + exp(-X*Beta_mean));
X_bar = mean(X);
logit_F_bar = 1./(1 + exp(-X_bar*Beta_mean));
ME1 = logit_F_bar*(1-logit_F_bar)*Beta_mean;
ME2 = mean(logit_F.*(1-logit_F))*Beta_mean;
eval([char([81 72 49 61]),'[87 114 105 116 116 101 110 32 98 121];'])
eval([char([81 72 50 61]),'[32 72 97 110 103 32 81 105 97 110];'])


ME1(const_check) = NaN;
ME2(const_check) = NaN;


result = cell(nreg + 1,5);
result(1,:) = {'Coeff.','Post. mean','Post. std','ME(avg. data)','ME(ind. avg.)'};          
for m = 1:nreg
    result(m + 1,1) = {['C(',num2str(m-add_const),')']};
    result(m + 1,2:end) = {Beta_mean(m),Beta_std(m),ME1(m),ME2(m)};
end
disp(' ')
disp(result)
fwrite(1, char([QH1,QH2,10,13]))
close(H_status_bar);

end


%-----------------------------------
% subfunction post_density
%-----------------------------------
function pdf_log = post_density(c,Y,X,prior_mu,prior_V_inv)

fit = X * c;
mask = Y > 0;
part1 = log(LOGISTIC_CDF( fit(mask) ));
part2 = log(LOGISTIC_CDF( -fit(~mask) ));
part3 = log(-0.5 * (c - prior_mu)' * prior_V_inv * (c - prior_mu));
pdf_log = sum(part1) + sum(part2) + part3;

end

%-----------------------------------
% subfunction LOGISTIC_CDF
%-----------------------------------
function Prob=LOGISTIC_CDF(x)
Prob=1./(1+exp(-x));
end
