function matrix = gethopMatrix_2(n,hopMatrix1,rho)
    % modification- OCt 22 2017
    % n - size of the matrix
    % P_12 P_13 P_14
    %     P_23 P_24
    %         P_34

    b = -log(hopMatrix1);% b marix for all transmissions
    theta = sqrt((2*b)./(1-rho^2));% theta matrix for all transmissions
    matrix = zeros(n,n);

    for i=1:n %rows
        for j=1:n %columns
            if i ~=j && i ~=n
                Q_1 = marcumq( theta(i,j) , ( rho*theta(i,j)) );
                Q_2 = marcumq( (rho*theta(i,j)), theta(i,j) );
                matrix(i,j) = ( Q_1 - Q_2 )/( exp(b(i,j)) - 1 );
            end
        end
    end

end

