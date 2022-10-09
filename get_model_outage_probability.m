function ret = get_model_outage_probability(target_sir, nakagami_m, main_len, main_los_prob, main_tx_power, intf_len, intf_los_prob, intf_tx_power)
    po_ll = 0;
    po_ln = 0;
    po_nl = 0;
    po_nn = 0;

    % (L, L)
    main_beta = get_beta(main_tx_power, main_len, get_alpha(true));
    intf_beta = get_beta(intf_tx_power, intf_len, get_alpha(true));
    po_ll = get_po_ll(nakagami_m, target_sir, main_beta, intf_beta);
    fprintf("po_ll: %f, ", po_ll);

    % (L, N)
    main_beta = get_beta(main_tx_power, main_len, get_alpha(true));
    intf_beta = get_beta(intf_tx_power, intf_len, get_alpha(false));
    po_ln = get_po_ln(nakagami_m, target_sir, main_beta, intf_beta);
    fprintf("po_ln: %f, ", po_ln);

    % (N, L)
    main_beta = get_beta(main_tx_power, main_len, get_alpha(false));
    intf_beta = get_beta(intf_tx_power, intf_len, get_alpha(true));
    po_nl = get_po_nl(nakagami_m, target_sir, main_beta, intf_beta);
    fprintf("po_nl: %f, ", po_nl);

    % (N, N)
    main_beta = get_beta(main_tx_power, main_len, get_alpha(false));
    intf_beta = get_beta(intf_tx_power, intf_len, get_alpha(false));
    po_nn = get_po_nn(nakagami_m, target_sir, main_beta, intf_beta);
    fprintf("po_nn: %f, ", po_nn);

    ret = po_ll * (main_los_prob) * (intf_los_prob); 
    ret = ret + po_ln * (main_los_prob) * (1 - intf_los_prob);
    ret = ret + po_nl * (1 - main_los_prob) * (intf_los_prob);
    ret = ret + po_nn * (1 - main_los_prob) * (1-intf_los_prob);

end