

m = integral(@(x) x.*density(x),-Inf,Inf)

v = integral(@(x) ((x-m).^2).*density(x),-Inf,Inf)


theta = 0.0632

lambda = 1.7718

kappa = 0.5

p = 1-integral(@(x) density(x),theta-sqrt(lambda),theta+sqrt(lambda))

if p > kappa
    
    J = v
    
else
    
    J = integral(@(x) ((x-theta).^2).*density(x),theta-sqrt(lambda),theta+sqrt(lambda))

end

