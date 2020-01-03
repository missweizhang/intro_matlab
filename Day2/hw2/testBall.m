%% Optional Problem 9 Functions

% test throwing a ball
N = 30;

initVel = 4; % initial velocity in m/s
theta = linspace(0,60,N); %  initial velocity angle in degrees
distance = zeros(1,N); % distance ball hits ground
for n = 1 : N
    distance(n) = throwBall( initVel, theta(n) );
end

figure;
plot(distance, 'k-');
xlabel('Initial angle (deg)');
ylabel('Distance thrown (m)');
title('Distance of a ball as a function of release angle');
