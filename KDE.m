function [f] = KDE(x)

global M data h

f = 0;

for m = 1:M
    
   f = f + (1/(h*M))*exp(-0.5*((x-data(m))/h)^2)/(sqrt(2*pi));
    
end

end