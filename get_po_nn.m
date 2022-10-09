function ret = get_po_nn(nakagami_m, target_sir, main_beta, intf_beta)
    ml = nakagami_m;
    bi = intf_beta;
    bm = main_beta;
    gt = target_sir;

    ret = 1 - ((bm)/(gt*bi+bm));
end