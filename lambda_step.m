function [J] = lambda_step(lambda)

global kappa theta

if lambda < 0
    
    J = -(1-kappa);
    
end

if lambda >= 0

J = integral(@(x) density(x),theta-sqrt(lambda),theta+sqrt(lambda)) - (1- kappa);

end

end