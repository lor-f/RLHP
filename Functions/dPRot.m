function [RotLoss] = dPRot(L_slug, rho_l, RotSpeed, RPos, no_slug, pos_slug, N)
% locate the COM of liquid slugs and calculate radial position of COM
r = zeros(no_slug,1);
for ns = 1:no_slug
    wall_posl = pos_slug(ns,:);
    if wall_posl(end) > wall_posl(1)
        wwl = wall_posl(1) : wall_posl(end);
    elseif wall_posl(end) < wall_posl(1)
        wwl = [wall_posl(1):N, 1:wall_posl(end)];
    end
    COM = round(median(wwl));
    r(ns,:) = RPos(COM);
end
% locate radius of COM and apply pressure

RotLoss = rho_l.*L_slug.*1e-3.*r.*1e-3.*RotSpeed.^2;
end
