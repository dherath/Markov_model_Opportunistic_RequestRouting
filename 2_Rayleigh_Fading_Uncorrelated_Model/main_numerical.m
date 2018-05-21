%clc;
%clear;
n=4; % number of nodes
p=0.9;% maximum one hop probability 
pList = 0.1:0.1:p;%a list of one hop probabilities 0.1-0.9
alpha = 0.8; % zipfian parameter
totContent = 100; %total content
%----------------------------
popularity = zipf_rand(1000,alpha,totContent);%seed(100)
popularity = sort(popularity,'descend');
popularity = popularity/sum(popularity);
%----------------------------
cacheSize = 20;
content_2 = hitMatrix(n,totContent,cacheSize);
D_list_num = zeros(1,length(pList));
for i = 1 : length(pList)
    %-------- numerical -----------------------
       individual_T = zeros(1,totContent);%delay values for individual content
       for j = 1 : totContent
          hits = content_2(j,:);
          individual_T(j) = Throughput(n,pList(i),hits);
       end
       D_list_num(i) = sum(popularity./individual_T);
       disp(strcat('numerical done ',num2str(i)));      
end
disp('numerical complete');


