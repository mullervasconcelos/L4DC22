function [J] = lambda_step_KDE(lambda)

global data kappa theta h

if lambda < 0
    
    J = -(1-kappa);
    
end

if lambda >= 0

J = integral_KDE(lambda) - (1- kappa);

end

end