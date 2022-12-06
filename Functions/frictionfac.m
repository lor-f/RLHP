function [Re, f] = frictionfac(p, rho_l, D_i, mu_l, no_slug, A_f, L_slug)
f = zeros(no_slug,1);
u_l = p./(A_f.*rho_l.*(L_slug/1000));
Re = abs((rho_l.*u_l.*D_i)./mu_l);
Re(Re < 0.5) = 0.5;
for ns = 1:no_slug
    if Re(ns) < 2000
        ff = 64/Re(ns);
    elseif Re(ns) >= 2000
        ff = 0.3164*((Re(ns))^-0.25);
    end
    f(ns,:) = ff;
end
end