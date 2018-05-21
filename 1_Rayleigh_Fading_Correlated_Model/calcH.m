function m = calcH(n,H,h)

m = zeros(1,n-1);% the matrix

for i = 1:n-1
    multV = 1;
    p_set = h(i,H);
    for k=1:length(p_set)
        multV = multV*(1-p_set(k));
    end
    m(i) = multV;
end

end

