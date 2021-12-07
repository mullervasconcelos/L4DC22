close all

global M data h

mu = [-2; -1; 0; 1; 2];

sigma = cat(3,[0.2],[0.075],[0.1],[0.1],[0.1]);

p = [0.2 0.2 0.1 0.3 0.2];

gm = gmdistribution(mu,sigma,p);

% Sample size M

M = 10^5;

data = random(gm,M);

x = data;

x_bar = mean(data);

s = sqrt(sum((x-x_bar).^2)/(M-1));

Q = iqr(x);

h = 1.06*min(s,Q/1.34)*(M^-(0.2));

x = [-5:0.001:5];

y = zeros(1,length(x));

f = zeros(1,length(x));

for k=1:length(x)

y(k) = KDE(x(k));

f(k) = density(x(k));

end


histogram(data,'Normalization','pdf')
hold

plot(x,y,'LineWidth',2)

plot(x,f,'LineWidth',2)


