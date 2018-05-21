function x = zipf_rand(N, expn, M)
% Generate random numbers based on Zipf distribution
% Author: Tuyen Tran (tuyen.tran@rutgers.edu). Oct 2015
%
% Reference: https://en.wikipedia.org/wiki/Zipf's_law
%
% N         Number of Elements
% expn      Exponent
% M         Number of sample to be generated
%
% Example: zipf_rand(3,1,4)
% ans = 3 2 1 1
rng(100);%uses same seed for all random number generations-dinal
if nargin == 2
    M = 1;
end

ranks = 1:1:N;

pmf = (ranks.^(-expn))/sum(ranks.^(-expn));

samples = rand(1,M);

p = cumsum(pmf(:));

[~,x] = histc(samples,[0;p/p(end)]);

end

