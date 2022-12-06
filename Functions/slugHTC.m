function [h_l] = slugHTC(Re, Pr, k_l, D_i, f, no_slug, L_slug)
    h_l = zeros(no_slug,1);
    for ns = 1:no_slug
        if Re(ns)<2000
            hprod = Re(ns)*Pr(ns)*(D_i/(L_slug(ns)/1000));
            if hprod>=33.3
                hl = (k_l(ns)/D_i)*1.953*(hprod^(1/3));
            elseif hprod<33.3
                hl = (k_l(ns)/D_i)*(4.364+(0.0722*hprod));
            end
        elseif (Re(ns)>=2000) && (Re(ns)<=10000)
            hl = (k_l(ns)/D_i)*(((f(ns)/8)*(Re(ns)-1000)*Pr(ns))/...
                (1+(12.7*(((f(ns)/8)^0.5)*((Pr(ns)^(2/3))-1)))));
        elseif Re(ns)>10000
            hl = (k_l(ns)/D_i)*(0.023*(Re(ns).^0.8)*(Pr(ns).^0.4));
        end
        h_l(ns,:) = hl;
    end
end