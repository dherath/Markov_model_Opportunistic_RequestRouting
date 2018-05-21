function t = Throughput(n,p,hits)
%calculates throughput for uncorrelted fading
%n size of matrix
%p the probability for one hop (successive distances are simillar)
%hits hit distribution for the content in question

P = getTransMatrix(n,p,hits);%transition matrix for some content
steady = P^1000;%assuming 1000 is a reasonable power to get steady state
t = steady(1,n);

end

