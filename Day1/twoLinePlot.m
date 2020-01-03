% MIT 6.057 Intro Matlab 
% Homework 1
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/assignments/MIT6_057IAP19_hw1.pdf
%

%% Problem 7 Plotting Multiple Lines and Colors

% (b)
figure

% (c)
t = linspace( 0, 2*pi, 1000 );
plot( t, sin(t) );
hold on
plot( t, cos(t), 'r-' );
hold off

% (d)
xlabel('Time (s)');
ylabel('Function value');
title('Trigonometric functions');
legend('sin', 'cos');

% (e)
xlim([0, 2*pi]);
ylim([-1.4, 1.4]);
