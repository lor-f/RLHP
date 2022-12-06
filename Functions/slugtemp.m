function [T_l] = slugtemp(k_l, A_f, c_pl, dz, rho_l, dt, h_l, p_i, no_slug,...
    pos_slug, L_slug, T_w0, T_l, P_v, N, phase, slugplug,fluid)
% vectors incremented between each meniscus serves as the matching
% ...operation (wall_posl)
for v = 1:no_slug
    a_El = (k_l(v)*A_f)/(c_pl(v)*dz);
    a_P0l = (rho_l(v)*A_f*dz)/dt;
    S_pl = (h_l(v)*p_i*dz)/c_pl(v);
    a_Pl = a_P0l + a_El + a_El + S_pl;
    
    wall_posl = pos_slug(v,:);
    if wall_posl(end) > wall_posl(1)
        wwl = wall_posl(1) : wall_posl(end);
    elseif wall_posl(end) < wall_posl(1)
        wwl = [wall_posl(1):N, 1:wall_posl(end)];
    end
    
    % 1. coefficient matrix ML (simple triadiagonal)
    ML = diag(a_Pl*ones(1,L_slug(v))) + diag(-a_El*ones(1,L_slug(v)-1),1) + diag(-a_El*ones(1,L_slug(v)-1),-1);
    ML(1,1) = 1;
    ML(1,2) = 0;
    ML(L_slug(v),L_slug(v)-1) = 0;
    ML(L_slug(v),L_slug(v)) = 1;
    
    %2. solution matrix SL
    Sl = zeros(L_slug(v)-2,1);
    s = 1;
    reduction = T_l(phase == 1 & slugplug == v);
    for i = 2:L_slug(v)-1
        S_cl = (h_l(v)*T_w0(wwl(i))*p_i*dz)/c_pl(v);
        Sl(s,:) = S_cl + (a_P0l*reduction(i));
        s = s+1;
    end
    
    % dirichlect (fixed) boundary conditions
    vidx = v + 1;
    if vidx > no_slug
        vidx = 1;
    end
    
    T1 = eval(append(fluid,'Tsat(P_v(v))'));
    T2 = eval(append(fluid,'Tsat(P_v(vidx))'));
    
    SL = [T1; Sl; T2];
    
    T_l(phase == 1 & slugplug == v) = ML\SL;
end
end