function [QSensTot, QLatTot] = finddist(N, phase,slugplug,k_l,p_i,dz,h_l,T_w,T_l,film,T_v)

for i = 1:N
    % in the total case
    if phase(i) == 0
        QelmV(i) = (k_l(slugplug(i))/film(i))*(T_w(i)-T_v(slugplug(i)))*p_i*dz;
    elseif phase(i) == 1
        QelmL(i) = h_l(slugplug(i))*dz*p_i*(T_w(i) - T_l(i));
    end

%     % in the evaporator case
%     idxE = (i >= section_E(:,1)) & (i <= section_E(:,2));
%     if phase(i) == 0 && sum(idxE) > 0
%         QelmVE(i) = (k_l(slugplug(i))/film(i))*(T_w(i)-T_v(slugplug(i)))*p_i*dz;
%         QelmLE(i) = 0.0;
%     elseif phase(i) == 1 && sum(idxE) > 0
%         QelmLE(i) = h_l(slugplug(i))*dz*p_i*(T_w(i) - T_l(i));
%         QelmVE(i) = 0.0;
%     end
% 
%     % in the condesor case
%     idxC = (i >= section_C(:,1)) & (i <= section_C(:,2));
%     if phase(i) == 0 && sum(idxC) > 0
%         QelmVC(i) = (k_l(slugplug(i))/film(i))*(T_w(i)-T_v(slugplug(i)))*p_i*dz;
%         QelmLC(i) = 0.0;
%     elseif phase(i) == 1 && sum(idxC) > 0
%         QelmLC(i) = h_l(slugplug(i))*dz*p_i*(T_w(i) - T_l(i));
%         QelmVC(i) = 0.0;
%     end    
% 
%         % in the adiabatic case
%     if phase(i) == 0 && sum(idxC) == 0 && sum(idxE) == 0
%         QelmVA(i) = (k_l(slugplug(i))/film(i))*(T_w(i)-T_v(slugplug(i)))*p_i*dz;
%         QelmLA(i) = 0.0;
%     elseif phase(i) == 1 && sum(idxC) ==0 && sum(idxE) == 0
%         QelmLA(i) = h_l(slugplug(i))*dz*p_i*(T_w(i) - T_l(i));
%         QelmVA(i) = 0.0;
%     end  

end
QSensTot = sum(abs(QelmL));
QLatTot = sum(abs(QelmV));

% QSensTotEvap = sum(abs(QelmLE));
% QLatTotEvap = sum(abs(QelmVE));
% 
% QSensTotCond = sum(abs(QelmLC));
% QLatTotCond = sum(abs(QelmVC));
% 
% QSensTotAdia = sum(abs(QelmLA));
% QLatTotAdia = sum(abs(QelmVA));