function matrix = gethopMatrix_1(n,p)
% modification- OCt 20 217
% n - size of the matrix
% p - intital probability
matrix = zeros(n,n);

for i=1:n %rows
    p_=p;
    count = 1;
    count2=i-1;
    for j=1:n %columns
        if i<j
            matrix(i,j)= p_^(count.^2);
            count = count + 1;
        elseif i>j && i ~= n
            matrix(i,j)= p_^(count2.^2);
            count2 = count2-1;  
        end
    end
end

for i=1:n
    matrix(i,1) = 0;
end

%disp('hops matrix ->');
%disp(matrix);
end

