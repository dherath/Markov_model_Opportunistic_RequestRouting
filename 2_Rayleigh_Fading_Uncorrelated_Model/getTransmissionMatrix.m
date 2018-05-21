function matrix = getTransmissionMatrix(n,p)
    % modification- OCt 20 217
    % n - size of the matrix
    % p - intital probability
    
    % new modification for both directions
    % added on Oct 27
    
    matrix = zeros(n,n);
    % forward ->
    
    % 0 P12 P13 P14
    % 0  0  P23 P24
    % 0  0   0  P34
    % 0  0   0   0
    
    % backward -> 
    
    % 0    0     0   0
    % P21  0     0   0
    % P31  P32   0   0
    %  0    0    0   0

    for i=1:n %rows
        p_=p;
        count1 = 1;
        count2 = i-1;
        for j=1:n %columns
            if i<j
                %matrix(i,j)= p_^(count1);
                matrix(i,j)= p_^(count1^2);
                count1 = count1 + 1;
            elseif i>j && i ~= n
                %matrix(i,j)= p_^(count2);
                matrix(i,j)= p_^(count2^2);
                count2 = count2-1;
                
            end
        end
    end
    disp("Transmission matrix");
    disp(matrix);
end

