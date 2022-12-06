function [T_w] = walltemp(N, phase, slugplug, p_i, c_pw, h_c, p_o...
    ,h_l, section_E, section_C, dz, T_w, T_c, q_in, T_l, T_v, k_lV, A_w,...
    rho_w, dt, k_w, film)

a_P0w = (rho_w*A_w*dz)/dt;
a_Ew = (k_w*A_w)/(c_pw*dz);

M = zeros(N);
for k = 1:N
    if phase(k) == 0
        plug_no = slugplug(k);        
        S_pvw = ((k_lV(plug_no)/film(k))*p_i*dz)/c_pw;
        a_Pvw =  a_P0w + a_Ew + a_Ew + S_pvw;      
        idx_C = (k>=section_C(:,1)) & (k<=section_C(:,2));
        if sum(idx_C)>0
            if k == 1
                cols = [a_Pvw + ((h_c*p_o*dz)/c_pw);-a_Ew;zeros(N-3,1);-a_Ew];
            elseif k == N
                cols = [-a_Ew;zeros(N-3,1); -a_Ew; a_Pvw + ((h_c*p_o*dz)/c_pw)];
            else
                cols = [zeros(k-2,1); -a_Ew; a_Pvw + ((h_c*p_o*dz)/c_pw); -a_Ew; zeros((N-1-k),1)];
            end
        else
            if k == 1
                cols = [a_Pvw;-a_Ew;zeros(N-3,1);-a_Ew];
            elseif k == N
                cols = [-a_Ew;zeros(N-3,1);-a_Ew;a_Pvw];
            else
                cols = [zeros(k-2,1); -a_Ew; a_Pvw; -a_Ew; zeros((N-1-k),1)];
            end
        end
    else
        slug_no = slugplug(k);
        S_plw = (h_l(slug_no)*p_i*dz)/c_pw;
        a_Plw = a_P0w + a_Ew + a_Ew + S_plw;
        idx_C2 = (k>=section_C(:,1)) & (k<=section_C(:,2));
        if sum(idx_C2)>0
            if k == 1
                cols = [a_Plw + ((h_c*p_o*dz)/c_pw);-a_Ew;zeros(N-3,1);-a_Ew];
            elseif k == N
                cols = [-a_Ew;zeros(N-3,1);-a_Ew;a_Plw + ((h_c*p_o*dz)/c_pw)];
            else
                cols = [zeros(k-2,1); -a_Ew; a_Plw + ((h_c*p_o*dz)/c_pw); -a_Ew; zeros((N-1-k),1)];
            end
        else
            if k == 1
                cols = [a_Plw;-a_Ew;zeros(N-3,1);-a_Ew];
            elseif k == N
                cols = [-a_Ew;zeros(N-3,1);-a_Ew;a_Plw];
            else
                cols = [zeros(k-2,1); -a_Ew; a_Plw; -a_Ew; zeros((N-1-k),1)];
            end
        end
    end
    M(:,k) = cols;
end

% 2. Solution matrix S
S = zeros(N,1);
for i = 1:N
    if phase(i) == 0
        plug_no = slugplug(i);
        S_Cin = ((k_lV(plug_no)/film(i))*T_v(plug_no)*p_i*dz)/c_pw;
    else
        slug_no = slugplug(i);
        S_Cin = (h_l(slug_no)*T_l(i)*p_i*dz)/c_pw;
    end
    
    idx_C3 = (i>=section_C(:,1)) & (i<=section_C(:,2));
    idx_E = (i>=section_E(:,1)) & (i<=section_E(:,2));
    if sum(idx_C3)>0
        rows = (a_P0w*T_w(i)) + S_Cin + ((h_c*T_c*p_o*dz)/c_pw);
    elseif sum(idx_E)>0
        rows = (a_P0w*T_w(i)) + S_Cin + ((q_in*p_o*dz)/c_pw);
    else
        rows = (a_P0w*T_w(i)) + S_Cin;
    end
    S(i,:) = rows;
end
T_w = M\S;
end