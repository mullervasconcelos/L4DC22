function [F] = transition(p)

kappa = 0.5;

n = 100000;

F = binocdf(kappa*n,n,p,'upper')



