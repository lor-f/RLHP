function [rho_l, k_l, mu_l, Pr, c_pl, k_lV] = fluidprops(T_l, no_slug, fluid, phase, slugplug, T_v)
rho_l =  zeros(no_slug,1);
k_l = zeros(no_slug,1);
mu_l = zeros(no_slug,1);
Pr =  zeros(no_slug,1);
c_pl = zeros(no_slug,1);
for ns = 1:no_slug
     rho_l(ns,:) = mean(eval(append(fluid,'RHO(T_l(phase==1 & slugplug == ns))')));
     k_l(ns,:) = mean(eval(append(fluid,'KL(T_l(phase==1 & slugplug == ns))')));
     mu_l(ns,:) = mean(eval(append(fluid,'MU(T_l(phase==1 & slugplug == ns))')));
     Pr(ns,:) = mean(eval(append(fluid,'PR(T_l(phase==1 & slugplug == ns))')));
     c_pl(ns,:) = mean(eval(append(fluid,'CPL(T_l(phase==1 & slugplug == ns))')));
end
k_lV = eval(append(fluid,'KL(T_v)'));
end