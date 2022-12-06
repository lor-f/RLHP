function [no_plug, no_slug, pos_slug_pure, L_slug, pos_plug, z_p] = initpos(pos_slug, N, dz)
no_slug = length(pos_slug);
no_plug = no_slug;
pos_slug_pure = pos_slug;
L_slug = zeros(no_slug,1);
for ns = 1:no_slug
    if pos_slug(ns,2) > pos_slug(ns,1)
        L = (pos_slug(ns,2) - pos_slug(ns,1))+1;
    else
        L = (N - pos_slug(ns,1) + pos_slug(ns,2))+1;
    end
    L_slug(ns,:) = L;
end

if no_plug == 1
    pos_plug = [pos_slug(1,2) pos_slug(1,1)];
else
    pos_plug = [[pos_slug(no_slug,2) + 1, pos_slug(1,1) - 1]; [pos_slug(1:end-2,2) + 1,...
        pos_slug(2:end-1,1) - 1]; [pos_slug(no_slug-1,2) + 1, pos_slug(no_slug,1) - 1]];
end

for z = 1:numel(pos_plug)
    if pos_plug(z)>N
        pos_plug(z) = pos_plug(z) - N;
    elseif pos_plug(z) < 1
        pos_plug(z) = pos_plug(z) + N;
    else
        pos_plug(z) = pos_plug(z);
    end
end

z_p = zeros(no_plug,1);
for np = 1:no_plug
    if pos_plug(np,2) > pos_plug(np,1)
        Lp = (pos_plug(np,2) - pos_plug(np,1))+1;
    else
        Lp =(N - pos_plug(np,1) + pos_plug(np,2))+1;
    end
    z_p(np,:) = Lp.*dz;
end

end