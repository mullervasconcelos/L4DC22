function [p] = integral_KDE(lambda)

global data kappa theta h

x = data;

p = 0.5*mean(erf((theta-x+sqrt(lambda))/(sqrt(2)*h))-erf((theta-x-sqrt(lambda))/(sqrt(2)*h)));

end
