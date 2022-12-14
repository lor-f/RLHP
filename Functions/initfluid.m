function [p, P_v, p0, m0, V0] = ...
    initfluid(no_slug, no_plug, z_p, A_f, T_v, fluid, R)
P_v = eval(append(fluid,'sat(T_v)'));
V0 = (A_f.*z_p) + zeros(no_plug,1);
m0 = (V0.*P_v)./(R.*T_v);
p = zeros(no_slug,1);
p0 = zeros(no_slug,1);
end   