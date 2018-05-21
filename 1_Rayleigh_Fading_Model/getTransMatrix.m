function P = getTransMatrix(n,p,hits,rho)
    %n the number of nodes
    %p the initial transmission probability
    %hits the content placement 
    %P th transission matrix for some fth content

    N = 2*(n-1); % number of total states
    P = zeros(N,N);
    H = find(hits==1); % the whole set with possible hits
    M = find(hits==0); % the whole set with misses
    
    h1 = gethopMatrix_1(n,p);
    h2 = gethopMatrix_2(n,h1,rho);
    % have a function to calculate As and A_
    
   % A = zeros(1,n);
    %A_ = zeros(1,n);
    
    A = calcH(n,H,h1);
    A_ = calcH(n,H,h2);
      
%     A
%     A_
    %test_matrix = zeros(N,N); %transitions are correct
%     I_test = zeros(N,N);
%     J_test = zeros(N,N);
    
    %---------------------
    % I_state = 0 (non star) 1(star)
    % J_state = 0 (non star) 1(star)
    for I=1:N
        for J=1:N
            %---------------------------
            if I==1
                i=1;
                I_state = 1;
            elseif I==N
                i=n;
                I_state = 0;
            elseif mod(I,2) == 0
                i = ceil((I+1)/2);
                I_state = 0;
            else
                I_state = 1;
            end
            %---------------------------
            if J == 1
                j = 1;
                J_state =  1;
            elseif J == N
                j = n;
                J_state = 0;
            elseif mod(J,2)==0
                j=j+1;
                J_state = 0 ;
            else
                J_state = 1 ;
            end
%             I_test(I,J) = i;
%             J_test(I,J) = j;
%             %---------------------------
            if hits(i) == 1 && i ~=n
                if isequal(j,n)
                    P(I,J) = 1;
                else
                    P(I,J) = 0;
                end
            elseif hits(j) == 1 && j ~=n
               P(I,J) = 0;
            else
                %----P_0, non star-> non star------
                if I_state == 0 && J_state == 0
                    if i<j && i<n
                        P(I,J) = h1(i,j)*prodV(j,M,h1(i,:))*A(i);
                    end
                    if j==n && i < n
                        P(I,J) = 1 - A(i); % new change                 
                    end
                    if i==n && j<n
                        P(I,J) = h1(1,j)*prodV(j,M,h1(1,:))*A(1); % change
                    end
                    if i==n && j==n
                        P(I,J) = 1 - A(1);
                    end
                  %-----P_1, non star -> star --------              
                elseif I_state == 0 && J_state == 1    
                    %test_matrix(I,J) = 1;                

                    if i==j && i<n
                        P(I,J) = prodV(j,M,h1(i,:))*A(i);
                    end
                    if i==n && j==1
                        P(I,J) = prodV(j,M,h1(1,:))*A(1); % change
                    end
                %------P_2, star -> non_star -------     
                elseif I_state == 1 && J_state == 0
                    %test_matrix(I,J) = 2;              
                    if i<j && i<n
                        P(I,J) = h2(i,j)*prodV(j,M,h2(i,:))*A_(i);
                    end
                    if j==n && i<n
                        P(I,J) = 1 - A_(i);
                    end
                 %------P_3, star -> star -----------               
                elseif I_state == 1 && J_state == 1
                    %test_matrix(I,J) = 3;
                   if i==j && i<n
                        P(I,J) = prodV(j,M,h2(i,:))*A_(i);
                   end
                end 
                %--------------------------------------
            end
           % if hits(i) == 1 && i~=n
           %     P(I,:) = 0;
           %     P(I,N) = 1;
           % end
           % if hits(j) == 1 && j ~=n
           %     P(I,J) = 0;
           % end
            %--------------------------------------            
           % P
        end        
    end
   %disp(test_matrix); -> correct
%    disp('start relays ->');
%    disp(I_test);
%    disp('end relays->');
%    disp(J_test);

end

