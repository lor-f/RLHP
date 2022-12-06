function [pos_slug_pure, p, p0, u_l] = slugdisp(no_plug, P_v, A_f, L_slug, ...
    pos_slug_pure, rho_l, dt, p0, mu_l, D_i, no_slug, dPg, RPos, pos_slug, N)
dPv = zeros(no_plug,1);
RotSpeed = 10;
for j = 1:no_plug
    jj = j + 1;
    if jj > no_plug
        jj = 1;
    end
    dPv(j,:) = P_v(j) - P_v(jj);
    
end

% 4th order runge kutta solution momentum
RotLoss = dPRot(L_slug, rho_l, RotSpeed, RPos, no_slug, pos_slug, N);
k1 = (A_f.*(RotLoss - dPg + dPv - dPT(p0, A_f, L_slug, rho_l, mu_l, D_i, no_slug))).*dt;
k2 = (A_f.*(RotLoss - dPg + dPv - dPT(p0 + (k1/2), A_f, L_slug, rho_l, mu_l, D_i, no_slug))).*dt;
k3 = (A_f.*(RotLoss - dPg + dPv - dPT(p0 + (k2/2), A_f, L_slug, rho_l, mu_l, D_i, no_slug))).*dt;
k4 = (A_f.*(RotLoss - dPg + dPv - dPT(p0 + k3,A_f, L_slug, rho_l, mu_l, D_i, no_slug))).*dt;

p = ((1/6).*(k1 + (2.*k2) + (2.*k3) + k4)) + p0;

% slug movement

u_l = p./(A_f.*(L_slug./1000).*rho_l);
del_z = u_l.*dt.*1000;
pos_slug_pure = [pos_slug_pure(:,1) + del_z, pos_slug_pure(:,2) + del_z];
p0 = p;
end