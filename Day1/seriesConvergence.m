% MIT 6.057 Intro Matlab 
% Homework 1
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/assignments/MIT6_057IAP19_hw1.pdf
%

%% Optional Problem 2 Convergence of infinite series

% (b) geometric series sum_k=0^inf( p^k )
p = 0.99;
k = 0 : 1000;

% (c) compute terms element-wise
geomSeries = zeros( 1, length(k) ); % preallocate
this = 1;
for n = 1 : length(k) 
   geomSeries(n) = this;
   this = p * this;
end

geomSeries(1:5)

% (d) infinite series sum_k=0^inf( p^k ) = 1/(1-p)
G = 1/(1-p)

% (e) plot infinite series
figure
plot(linspace(0,max(k),10), G*ones(1,10), 'r-');

% (f) plot finite series
hold on
plot( k, cumsum(geomSeries) );

% (g)
legend('Infinite sum', 'Finite sum');
xlabel('Index');
ylabel('Sum');
title('Convergence of geometric series with p=0.99');

% (h)

%% (i) p-series sum_n=1^inf( 1/n^p )

% (j)
p = 2;
n = 1 : 500;

% (k)
pSeries = n .^ -p;

% (l) infinite series sum_n=1^inf( 1/n^2 )
P = pi^2 / 6;

% (m) plot infinite series
figure
plot(linspace(0,max(n),10), P*ones(1,10), 'r-');

% (f) plot finite series
hold on
plot( n, cumsum(pSeries) );

% (g)
legend('Infinite sum', 'Finite sum');
xlabel('Index');
ylabel('Sum');
title('Convergence of p-series with p=2');
