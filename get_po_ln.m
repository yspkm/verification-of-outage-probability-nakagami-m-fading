function ret = get_po_ln(nakagami_m, target_sir, main_beta, intf_beta)
    gt = target_sir;
    ml = nakagami_m;
    bm = main_beta;
    bi = intf_beta;
    ret = ((gt * bi) / bm) * ((1 + ((bm)/(gt*bi))) ^(-ml));
end