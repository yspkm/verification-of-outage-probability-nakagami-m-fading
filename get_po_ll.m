function ret = get_po_ll(nakagami_m, target_sir, main_beta, intf_beta)
    %hypergeom([a,b], c, z)
    ml = nakagami_m;
    bi = intf_beta;
    bm = main_beta;
    gt = target_sir;
    u  = (gt*bi*ml)/bm;
    f21 = hypergeom([1, 2*ml], ml+1, (u/(u+ml)));
    ret = f21 * ((ml^ml)/(gamma(ml)^2)) * (((u^ml) * gamma(2*ml)) / ((ml * (u+ml))^(2*ml)));
end