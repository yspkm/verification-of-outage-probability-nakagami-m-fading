function [ret_model_po, ret_simul_po] = get_test_vector(main_z, intf_z)
    % parameter
    % main_z = 100;
    % intf_z = 100;

    % constant
    iter_num = 100000;
    target_sir = 2;
    nakagami_m = 2;

    %main_alpha
    %= 2;
    %intf_alpha = 3.5;

    main_tx_power = 1;
    intf_tx_power = 0.5;

    main_x = 100; main_y = 100;
    intf_x = 150; intf_y = 150;
    user_x = 0; user_y = 0; user_z = 0;

    main_len = norm([main_x - user_x, main_y - user_y, main_z - user_z]);
    intf_len = norm([intf_x - user_x, intf_y - user_y, intf_z - user_z]);
    main_rad = norm([main_x - user_x, main_y - user_y]);
    intf_rad = norm([intf_x - user_x, intf_y - user_y]);

    % dhm = main_rad;
    % dhI = intf_rad;
    % dvm = main_z-user_z;
    % dvI = intf_z-user_z;

    % for PLoS
    a_los = 12.08;
    b_los = 0.11;

    main_los_prob = get_los_prob(main_rad, main_z, a_los, b_los);
    %disp(main_los_prob);
    intf_los_prob = get_los_prob(intf_rad, intf_z, a_los, b_los);
    %disp(intf_los_prob);
    ret_model_po = get_model_outage_probability(target_sir, nakagami_m, main_len, main_los_prob, main_tx_power, intf_len, intf_los_prob, intf_tx_power);
    ret_simul_po = get_rand_outage_probability(iter_num, target_sir, nakagami_m, main_len, main_los_prob, main_tx_power, intf_len, intf_los_prob, intf_tx_power);
    fprintf("po_model:%f, po_simul:%f\n", ret_model_po, ret_simul_po);
end
