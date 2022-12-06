function [pos_slug_pure, pos_slug, pos_plug] = wrap(pos_slug_pure, N, no_plug, no_slug)

for ns = 1:numel(pos_slug_pure)
    if pos_slug_pure(ns)>N
        pos_slug_pure(ns) = pos_slug_pure(ns) - N;
    elseif pos_slug_pure(ns)<0
        pos_slug_pure(ns) = pos_slug_pure(ns) + N;
    elseif pos_slug_pure(ns)==0
        pos_slug_pure(ns) = N;
    else
        pos_slug_pure(ns) = pos_slug_pure(ns);
    end
end

pos_slug = round(pos_slug_pure);

if no_plug == 1
    pos_plug = [pos_slug(1,2) + 1 pos_slug(1,1) - 1];
else
    pos_plug = [[pos_slug(no_slug,2) + 1, pos_slug(1,1) - 1]; [pos_slug(1:end-2,2) + 1,...
        pos_slug(2:end-1,1) - 1]; [pos_slug(no_slug-1,2) + 1, pos_slug(no_slug,1) - 1]];
end


for z = 1:numel(pos_slug)
    if pos_slug(z)>N
        pos_slug(z) = pos_slug(z) - N;
    elseif pos_slug(z)<0
        pos_slug(z) = pos_slug(z) + N;
    elseif pos_slug(z)==0
        pos_slug(z) = N;
    else
        pos_slug(z) = pos_slug(z);
    end
    
    if pos_plug(z) > N
        pos_plug(z) = pos_plug(z) - N;
    elseif pos_plug(z) < 0
        pos_plug(z) = pos_plug(z) + N;
    elseif pos_plug(z) == 0
        pos_plug(z) = N;
    else
        pos_plug(z) = pos_plug(z);
    end
end

end