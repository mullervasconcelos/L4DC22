function [p] = centroid_KDE(lambda)

global data kappa theta h

x = data;

p = mean(0.5*x.*erf((theta-x+sqrt(lambda))/(sqrt(2)*h)) -(h/sqrt(2*pi))*exp(-((theta-x+sqrt(lambda))/(sqrt(2)*h)).^2)  - 0.5*x.*erf((theta-x-sqrt(lambda))/(sqrt(2)*h)) +(h/sqrt(2*pi))*exp(-((theta-x-sqrt(lambda))/(sqrt(2)*h)).^2)      );

end
