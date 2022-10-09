function ret = get_fade_gain(nakagami_m, is_los)
    ret = exprnd(1,1);
    if is_los == true
        ret = gamrnd(nakagami_m, 1/nakagami_m, 1);
    end
end