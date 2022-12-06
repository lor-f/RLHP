function [T_w, T_w0, T_v, T_l] = inittemp(T_ini, N, no_slug)
T_w = T_ini + zeros(N,1);
T_w0 = T_w;
T_l = T_ini + zeros(N,1);
T_v = (T_ini) + zeros(no_slug,1);
end