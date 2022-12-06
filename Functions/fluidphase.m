function [phase, slugplug] = fluidphase(pos_slug, N, pos_plug)
phase = zeros(N,1);
slugplug = zeros(N,1);
for i = 1:N
   idxl = (i>=pos_slug(:,1)) & (i<=pos_slug(:,2)) |...
            (pos_slug(:,1)>pos_slug(:,2)) & ((i>=pos_slug(:,1)) | (i<=pos_slug(:,2)));
   idxv = (i>=pos_plug(:,1)) & (i<=pos_plug(:,2)) |...
            (pos_plug(:,1)>pos_plug(:,2)) & ((i>=pos_plug(:,1)) | (i<=pos_plug(:,2)));

   if sum(idxl)~=0
       slugno = find(idxl == 1);
       phase(i) = 1;
       slugplug(i) = slugno;
   elseif sum(idxv)~=0 
       plugno = find(idxv == 1);
       slugplug(i) = plugno;
   end
end
       