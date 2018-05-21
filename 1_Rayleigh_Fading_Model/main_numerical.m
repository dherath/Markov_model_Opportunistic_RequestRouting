clc;
clear;
n=4; % number of nodes
p=0.9;% maximum one hop probability 
pList = 0.1:0.1:p;%a list of one hop probabilities 0.1-0.9
alpha = 0.8; % zipfian parameter
totContent = 100; %total content
rho = 0.9; % correlation factor
%----------------------------
popularity = zipf_rand(1000,alpha,totContent);%seed(100)
popularity = sort(popularity,'descend');
popularity = popularity/sum(popularity);
%----------------------------
cacheSize = 10;
content_2 = hitMatrix(n,totContent,cacheSize);
%content_2 = zeros(totContent,n);
%content_2(:,end) = 1;
D_list_num10_r09 = zeros(1,length(pList));
for i = 1 : length(pList)
    %-------- numerical -----------------------
       individual_T = zeros(1,totContent);%delay values for individual content
       for j = 1 : totContent
          hits = content_2(j,:);
          individual_T(j) = Throughput(n,pList(i),hits,rho);
       end
       D_list_num10_r09(i) = sum(popularity./individual_T);
       disp(strcat('numerical done ',num2str(i)));
end
disp('numerical complete : correlated rho =0.9 C = 10');
%D_list_num = 1./D_list_num;
plot(D_list_num10_r09);
save('D_list_num10_r09.mat','D_list_num10_r09');
