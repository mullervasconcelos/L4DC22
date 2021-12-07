clc

clear all

global kappa theta

kappa = 0.5;
theta = -10;

lambda = 0;
lambda_star = 1;

while abs(lambda - lambda_star)>10^-6
    
    lambda = lambda_star;
    
    lambda_star = fzero(@(lambda) lambda_step(lambda), 0);
    
    theta_star = integral(@(x) x.*density(x),-Inf,Inf);
    
    while abs(theta-theta_star)>10^-6
        
        theta = theta_star;
        
        theta_star = integral(@(x) x.*density(x),theta-sqrt(lambda_star),theta+sqrt(lambda_star)) - kappa*theta;
        
    end
    
end

theta_star
lambda_star

J = integral(@(x) (x-theta_star).^2.*density(x),theta_star-sqrt(lambda_star),theta_star+sqrt(lambda_star))

