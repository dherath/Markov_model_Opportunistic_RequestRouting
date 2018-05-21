function val = prodV(j,M,h)
    loc = M(M>j);
    fwd_list = h(loc);
    multV = 1;
    for c=1:length(fwd_list)
        multV = multV * (1-fwd_list(c));
    end
    val = multV;
end

