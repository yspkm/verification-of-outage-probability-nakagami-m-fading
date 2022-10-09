function ret = get_rand_outage_probability(iter_num, target_sir, nakagami_m, main_len, main_los_prob, main_tx_power, intf_len, intf_los_prob, intf_tx_power)
    cnt = 0;
    is_main_los = false; is_intf_los = false;
    main_alpha = 2;intf_alpha = 2;
    main_gain = 1; intf_gain = 1;
    main_beta = 1; intf_beta = 1;

    for i = 0:iter_num
        is_main_los = is_los_rand(main_los_prob);
        is_intf_los = is_los_rand(intf_los_prob);

        main_gain = get_fade_gain(nakagami_m, is_main_los);
        intf_gain = get_fade_gain(nakagami_m, is_intf_los);

        main_alpha = get_alpha(is_main_los);
        intf_alpha = get_alpha(is_intf_los);
        main_beta = get_beta(main_tx_power, main_len, main_alpha);
        intf_beta = get_beta(intf_tx_power, intf_len, intf_alpha);

        if (main_gain * main_beta) / (intf_gain * intf_beta) < target_sir
            cnt = cnt + 1;
        end

    end

    ret = cnt / iter_num;
end