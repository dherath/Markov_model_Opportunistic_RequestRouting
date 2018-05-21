function P = getTransMatrix(n,p,hits)
%use for equidistant network nodes
%n the size of the matrix
%p the initial transmission probability
%P th transmission matrix for some fth content
%hits the content placement
P = zeros(n,n);
%-------------------------------------------------
% the set H-> node indices with hits
H = find(hits==1); % the whole set with possible hits
N = find(hits==0); % the whole set with misses
%-------------------------------------------------
for I=1:n-1 %I degenrates to i(i=n is seperate)
    for J=1:n %J degenerates to j (j=n is seperate)
        if hits(I) == 1
            if isequal(J,n)
                P(I,J) = 1;% cannot transmit from a node with content
            else
                P(I,J) = 0;
            end
        elseif hits(J)==1 && J~=n
            P(I,J) = 0;
        else
            if I>J
                P(I,J) = 0;
            elseif  J == n
                H_ = abs(H-I);%probability value,power
                %---------no hits-------------------
                multV = 1;
                for r = 1:length(H_)
                    multV = multV * (1-p^(H_(r)));
                end
                %--------------------------------
                P(I,J) = 1 - multV;
            elseif I==J
                    H_=abs(H-I);
                    %--------no hits--------------------
                    multV = 1;
                    for r = 1:length(H_)
                        multV = multV * (1-p^(H_(r)));
                    end
                    %---------no fwd Tr-----------------
                    fwd_list=N(N>I); % forward list
                    N_ = abs(fwd_list-I);%probability value power
                    multV2 = 1;
                    for r1 = 1 : length(N_)
                        multV2 = multV2 * (1-p^(N_(r1)));
                    end
                    P(I,J) = multV*multV2;
            elseif I<J
                    H_=abs(H-I);
                    %--------no hits--------------------
                    multV = 1;
                    for r = 1:length(H_)
                        multV = multV * (1-p^(H_(r)));
                    end
                    %-------the q values-----------------
                    fwd_set = N(N>J);
                    N_ = abs(fwd_set-I);
                    multV2 = 1;
                    for r1 = 1 : length(N_)
                        multV2 = multV2 * (1-p^(N_(r1)));
                    end
                    %-----the p value -------------------
                    pVal = p^(J-I);
                    P(I,J) = pVal*multV*multV2;
            end
        end
    end
end

%for i=1:length(H)-1
%   P(:,H(i)) = 0;
%end
    

%-----------I==N-------------------
P(n,:) = P(1,:);
end

