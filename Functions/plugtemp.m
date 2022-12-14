function [T_v, P_v, m0, V0, T_l] = plugtemp(A_f, T_v, no_plug, pos_plug, T_w0,...
    film, N, dz, m0, V0, p_i, dt, R, P_v, fluid, phase, slugplug, T_l, p, L_slug, rho_l)
u_l = p./(A_f.*(L_slug./1000).*rho_l);
Tvchangemax = 5;
for np = 1:no_plug
    nj = np - 1;
    if nj < 1
        nj = no_plug;
    end
    
    dVdt = A_f*(u_l(np) - u_l(nj));
    
    % 4th order runge kutta solution for vapor plug temperature
    
    V_vp = (dVdt.*dt) + V0(np);
    
    % -------------------------------------------------------------------------------------------

    mk1 = (dMdt(T_v(np), np, pos_plug, T_w0, film, N, dz, p_i, m0, V_vp, R, fluid)*dt) + m0(np);
    Pk1I = (mk1*R*(T_v(np)))/V_vp;
    Pk1S = eval(append(fluid,'sat(T_v(np))'));
    if Pk1I > Pk1S
        Pk1 = Pk1S;
    else
        Pk1 = Pk1I;
    end
    k1 = (((-Pk1*dVdt)+(R*(T_v(np))*...
        dMdt(T_v(np), np, pos_plug, T_w0, film, N, dz, p_i, m0, V_vp, R, fluid)))/...
        (mk1*eval(append(fluid,'CV(T_v(np))'))))*dt;
    
    % --------------------------------------------------------------------------------------------

    mk2 = (dMdt(T_v(np) + (k1/2), np, pos_plug, T_w0, film, N, dz, p_i, m0, V_vp, R, fluid)*dt) + m0(np);
    Pk2I = (mk2*R*(T_v(np)+(k1/2)))/V_vp;
    Pk2S = eval(append(fluid,'sat(T_v(np)+(k1/2))'));
    if Pk2I > Pk2S
        Pk2 = Pk2S;
    else
        Pk2 = Pk2I;
    end
    k2 = (((-Pk2*dVdt)+(R*(T_v(np) + (k1/2))*...
        dMdt(T_v(np) + (k1/2), np, pos_plug, T_w0, film, N, dz, p_i, m0, V_vp, R, fluid)))/...
        (mk2*eval(append(fluid,'CV(T_v(np)) + (k1/2)'))))*dt;
    

    T_vp = 0.5*(k1+k2) + T_v(np);

    
    if T_vp - T_v(np) > Tvchangemax
        T_vp = T_v(np) + Tvchangemax;
    elseif T_v(np) - T_vp > Tvchangemax
        T_vp = T_v(np) - Tvchangemax;
    end
    
    m_vp = (dMdt(T_vp,np, pos_plug, T_w0, film, N, dz, p_i, m0, V_vp, R, fluid)*dt) + m0(np);
    
    P_vpI = (m_vp*R*T_vp)/V_vp;
    P_vpS = eval(append(fluid,'sat(T_vp)'));
    
    if P_vpI > P_vpS
        P_vp = P_vpS;
    else
        P_vp = P_vpI;
    end

    P_v(np,:) = P_vp;
    T_v(np,:) = T_vp;
    m0(np,:) = m_vp;
    V0(np,:) = V_vp;
    T_l(phase == 0 & slugplug == np) = T_vp;
end
end








                   