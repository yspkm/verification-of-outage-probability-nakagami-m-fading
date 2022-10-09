function ret = get_po_nl(nakagami_m, target_sir, main_beta, intf_beta)
    ml = nakagami_m;
    bi = intf_beta;
    bm = main_beta;
    gt = target_sir;
    ret = ml^(ml-2) - ((ml^(-1))/(ml+((gt*bi)/(bm))));
end