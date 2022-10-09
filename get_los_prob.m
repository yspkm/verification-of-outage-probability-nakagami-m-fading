function ret = get_los_prob(r, z, a, b)
    theta = atan(z/r);
    ret = 1/(1+a*exp(-b*(theta-a)));
end