function ret = is_los_rand(pl)
    ret = false;
    if rand(1) <= pl 
        ret = true;
    end
end