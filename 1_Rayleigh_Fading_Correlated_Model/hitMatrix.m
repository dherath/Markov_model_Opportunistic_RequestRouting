function h = hitMatrix(n,totContent,cacheSize)
%h - the hit matrix tot * n
%n - number of nodes
%casheSize - cache capacity of a node = 10
%totContent - total number of content
rng(100);

h = zeros(totContent,n);
h(:,1) = 0; % source node has no cache
h(:,n) = 1;%destination has everyhting

% cache policy
% 1-5 -> from first 20 content
% 6-10 -> from rest 80 content

%cacheSize = 10;% < total content
for i=2:n-1
    list1 = randperm(20,cacheSize/2);
    list2 = randperm(80,cacheSize/2) + 20 ;
    list3 = [list1,list2];
    for j = 1:cacheSize
        h(list3(j),i) = 1;
    end
end

end

