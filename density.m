function [f] = density(x)

mu = [-2; -1; 0; 1; 2];

sigma = [0.2 0.075 0.1 0.1 0.1];

p = [0.2 0.2 0.1 0.3 0.2];

f = 0;

for i = 1:5

f = f + p(i)*normpdf(x,mu(i),sqrt(sigma(i)));

end

end