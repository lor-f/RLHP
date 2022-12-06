function [loss] = dPT(p, A_f, L_slug, rho_l, mu_l, D_i, no_slug)
u_l = p./(A_f.*(L_slug./1000).*rho_l);
Re = abs((rho_l.*u_l.*D_i)./mu_l);
f = zeros(no_slug,1);
for ns = 1:no_slug
    if Re(ns)<2000
        ff = 64/Re(ns);
    elseif Re(ns)>=2000
        ff = 0.3164*((Re(ns))^-0.25);
    end
    f(ns,:) = ff;
end
loss = (f./(2.*D_i)).*(L_slug/1000).*rho_l.*(u_l.^2);
loss(u_l < 0) = -loss(u_l < 0);
loss(f == inf) = 0;
end