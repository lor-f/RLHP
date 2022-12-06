function [mc] = dMdt(T_v, np, pos_plug, T_w0, film, N, dz, p_i, m0, V_vp, R, fluid)
PS = eval(append(fluid,'sat(T_v)'));
PI = (m0(np)*R*T_v)/V_vp;
if PI > PS
    P = PS;
else
    P = PI;
end
T_VS = eval(append(fluid,'Tsat(P)'));
n = np;
% trapezoidal integration of heat into vapor plugs 
    wall_pos = pos_plug(n,:);
    wallnd = wall_pos(2) - 1;
    wallst = wall_pos(1) + 1;
    
    if wallst > N
        wallst = 1;
    elseif wallnd < 1
        wallst = N;
    end
    
    if wallst < 1
        wallst = N;
    elseif wallnd > N
        wallnd = 1;
    end
    
    if wallnd > wallst
        L_plug = (wallnd) - (wallst) + 1;
        del_T = zeros(1,L_plug);
        zz = 1;
        for wwu = wallst : wallnd
            del_T(zz) = (T_w0(wwu) - T_VS)/film(wwu);
            zz = zz + 1;
        end
    elseif wallnd < wallst
        L_plug = (N - (wallst)) + (wallnd) + 1;
        del_T = zeros(1,L_plug);
        zz = 1;
        for wwu = [wallst:N, 1:wallnd]
            del_T(zz) = (T_w0(wwu)-T_VS)/film(wwu);
            zz = zz + 1;
        end
    end
    %z_p = L_plug./1000;
    del_T0 = (T_w0(wall_pos(1)) - T_VS)/film(wall_pos(1));
    del_Tf = (T_w0(wall_pos(2)) - T_VS)/film(wall_pos(2));
    qwp = (dz/2) * (eval(append(fluid,'KL(T_VS)'))) * (del_T0 + del_Tf + (2*sum(del_T)));

mc = (qwp*p_i)/eval(append(fluid,'H(T_v)'));
end