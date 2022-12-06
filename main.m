% calorimetric simulation of PHP operating with r134a
clc, clear

L = 0.460;
D_o = 0.003;
D_i = 0.002;
T_ini = 303;
T_c = 303;
h_c = 1000;
fluid = 'R134';

k_w = 400;
c_pw = 389;
rho_w = 8960;

pos_slug = [    10    56
    102   148
    194   240
    286   332
    378   424];


% section_E = [1 230];
% section_C = [231 460];

section_E = [190 230];
section_C = [420 460];

film = 1e-04;
R = 82;

q_in = 53052;
dt = 1e-03;

t = 0;
x = 1;
T = 10;

[dz, A_f, A_vp, A_w, p_i, p_o, N, RPos] = geometry(L, D_i, D_o, film, section_E);

[no_plug, no_slug, pos_slug_pure, L_slug, pos_plug, z_p] = initpos(pos_slug, N, dz);

[T_w, T_w0, T_v, T_l] = inittemp(T_ini, N, no_slug);

[p, P_v, p0, m0, V0] = initfluid(no_slug, no_plug, z_p, A_f, T_v, fluid, R);

film = film + zeros(N,1);

dPg = 0;

while t < T

    [phase, slugplug] = fluidphase(pos_slug, N, pos_plug);

    [rho_l, k_l, mu_l, Pr, c_pl, k_lV] = fluidprops(T_l, no_slug, fluid, phase, slugplug, T_v);

    [Re, f] = frictionfac(p, rho_l, D_i, mu_l, no_slug, A_f, L_slug);

    [h_l] = slugHTC(Re, Pr, k_l, D_i, f, no_slug, L_slug);


    [T_w] = walltemp(N, phase, slugplug, p_i, c_pw, h_c, p_o...
        ,h_l, section_E, section_C, dz, T_w, T_c, q_in, T_l, T_v, k_lV, A_w,...
        rho_w, dt, k_w, film);

    [T_l] = slugtemp(k_l, A_f, c_pl, dz, rho_l, dt, h_l, p_i, no_slug,...
        pos_slug, L_slug, T_w0, T_l, P_v, N, phase, slugplug,fluid);

    [T_v, P_v, m0, V0, T_l] = plugtemp(A_f, T_v, no_plug, pos_plug, T_w0,...
        film, N, dz, m0, V0, p_i, dt, R, P_v, fluid, phase, slugplug, T_l, p, L_slug, rho_l);

    [QSensTot, QLatTot] = finddist(N, phase,slugplug,k_l,p_i,dz,h_l,T_w,T_l,film,T_v);

    [pos_slug_pure, p, p0, u_l] = slugdisp(no_plug, P_v, A_f, L_slug, ...
        pos_slug_pure, rho_l, dt, p0, mu_l, D_i, no_slug,dPg, RPos, pos_slug, N);

    [pos_slug_pure, pos_slug, pos_plug] = wrap(pos_slug_pure, N, no_plug, no_slug);

    [merge] =  mergeevent(no_slug,pos_slug);

    if sum(merge) ~= 0.0
        % locate mergers
        mergers = find(merge == 1);
        for aa = 1:length(mergers)
            a = mergers(aa);
            mm = mergers(aa) + 1;
            if mm > no_slug
                mm = 1;
            end
            diff = pos_slug(mm,1) - pos_slug(a,2);
            newslug = [pos_slug(a,1),  pos_slug(mm,2)];
            pos_slug(a,:) = newslug;
            wall_posl = newslug;
            if wall_posl(end) > wall_posl(1)
                wwl = wall_posl(1) : wall_posl(end);
            elseif wall_posl(end) < wall_posl(1)
                wwl = [wall_posl(1):N, 1:wall_posl(end)];
            end
            p(a) = p(a) + p(mm);
            L_slug(a) = length(wwl);
        end
        mergeidx = mergers + 1;
        mergeidx(mergeidx > length(pos_slug)) = 1;
        pos_slug(mergeidx,:) = [];
        pos_slug_pure = pos_slug;
        L_slug(mergeidx) = [];
        p(mergeidx) = [];
        P_v(mergeidx) = [];
        T_v(mergeidx) = [];
        m0(mergeidx) = [];
        V0(mergeidx) = [];
        no_slug = size(pos_slug, 1);
        no_plug = no_slug;
        p0 = p;
        [pos_slug_pure, pos_slug, pos_plug] = wrap(pos_slug_pure, N, no_plug, no_slug);
    end
    
    T_w0 = T_w;

    Phase(:,x) = phase;
    momen(x) = sum(p);
    Tw(:,x) = T_w;
    Tl(:,x) = T_l;
    x = x + 1;
    t = t + dt
end
