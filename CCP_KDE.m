%close all 
clear all

global data kappa theta h

PP = [];

JJ = [];

CC = [];

for delta=[10^-5 3.5*10^-5 10^-4 3.5*10^-4 10^-3 3.5*10^-3 10^-2 3.5*10^-2 10^-1]

rel_freq = 0;

m = integral(@(x) x.*density(x),-Inf,Inf)

v = integral(@(x) ((x-m).^2).*density(x),-Inf,Inf)

K = 10^3

P = [];

J = [];

C = [];


for k=1:K
    
    k
    
    kappa_nominal = 0.5;

kappa = kappa_nominal-delta;

theta = rand;

mu = [-2; -1; 0; 1; 2];

sigma = cat(3,[0.2],[0.075],[0.1],[0.1],[0.1]);

p = [0.2 0.2 0.1 0.3 0.2];

gm = gmdistribution(mu,sigma,p);

% Sample size M

M = 10^5;

data = random(gm,M);

x_bar = mean(data);

s = sqrt(sum((data-x_bar).^2)/(M-1));

Q = iqr(data);

h = 1.06*min(s,Q/1.34)*(M^-(0.2));

lambda = 0;

lambda_star = 1;

while abs(lambda - lambda_star)>10^-6
    
    lambda = lambda_star;
    
    lambda_star = fzero(@(lambda) lambda_step_KDE(lambda), 0);
    
    theta_star = centroid_KDE(lambda) - kappa*theta;
    
    while abs(theta-theta_star)>10^-6
        
        theta = theta_star;
        
        theta_star = centroid_KDE(lambda) - kappa*theta;
        
    end
    
end

theta=theta_star;

lambda=lambda_star;

p = 1-integral(@(x) density(x),theta-sqrt(lambda),theta+sqrt(lambda));

P = [P p];

if p > kappa_nominal
    
    J = [v J];
    
    %C = [1 C];
    
else
    
    J = [integral(@(x) ((x-theta).^2).*density(x),theta-sqrt(lambda),theta+sqrt(lambda)) J];
    
    %C = [0 C];

end

%if p <= kappa
    
%    rel_freq = rel_freq + 1/K;
    
%end

end

JJ = [JJ J'];

PP = [PP P'];

%CC = [CC C'];

end


y = mean(JJ); % your mean vector;
x = [10^-5 3.5*10^-5 10^-4 3.5*10^-4 10^-3 3.5*10^-3 10^-2 3.5*10^-2 10^-1];
std_dev = std(JJ);
curve1 = y + std_dev;
curve2 = y - std_dev;
x2 = [x, fliplr(x)];
inBetween = [curve1, fliplr(curve2)];
fill(x2, inBetween, 'g','FaceAlpha',0.3);
hold on;
plot(x, y, 'g', 'LineWidth', 2);
set(gca, 'XScale', 'log')

% y = mean(PP); % your mean vector;
% x = [10^-5 3.5*10^-5 10^-4 3.5*10^-4 10^-3 3.5*10^-3 10^-2 3.5*10^-2 10^-1];
% std_dev = std(PP);
% curve1 = y + std_dev;
% curve2 = y - std_dev;
% x2 = [x, fliplr(x)];
% inBetween = [curve1, fliplr(curve2)];
% fill(x2, inBetween, 'b','FaceAlpha',0.3);
% hold on;
% plot(x, y, 'b', 'LineWidth', 2);
% set(gca, 'XScale', 'log')


%errorbar([10^-5 10^-4 10^-3 10^-2 10^-1],mean(JJ), std(JJ))
%set(gca, 'XScale', 'log')
%figure

%errorbar([10^-5 10^-4 10^-3 10^-2 10^-1],mean(PP), std(PP))
%set(gca, 'XScale', 'log')

%figure

%plot([10^-5 10^-4 10^-3 10^-2 10^-1],mean(CC))
%set(gca, 'XScale', 'log')

%histogram(PP)

%mean(PP>=0.5)

%figure 

%histogram(J)

%mean(P)

%std(P)

%mean(J)

%std(J)


