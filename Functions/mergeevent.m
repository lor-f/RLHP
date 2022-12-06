function [merge] =  mergeevent(no_slug,pos_slug)
ns = no_slug;
merge = zeros(no_slug,1);
for a = 1:ns
    mm = a + 1;
    if mm > no_slug
        mm = 1;
    end
    if  (pos_slug(mm,1) - pos_slug(a,2) <= 5) && (pos_slug(mm,1) - pos_slug(a,2) >= -25)
        merge(a) = 1;
    end
end
end