% MIT 6.057 Intro Matlab 
% Homework 1
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/assignments/MIT6_057IAP19_hw1.pdf
%

%% Optional Problem 1 Throwing a ball

% (b) constants and initial configuration
GACC = 9.8; % m/s^2, gravitational constant 

initHeight = 1.5; % m
initVel = 4; % m/s
initVelAngle = 45; % degrees

% (c) time vector
t = linspace(0,1,1000); % s

% (d) distance and height trajectory
x = initVel * cos( initVelAngle * pi / 180 ) * t; % distance
y =   initHeight ...
    + initVel * sin( initVelAngle * pi / 180 ) * t ...
    - GACC / 2 * t.^2; % height

% (e) hits ground
ind = find( y < 0 );
if ~isempty(ind)
    disp(['The ball hits the ground at a distance of ', ...
          num2str( x( ind(1) ) ), ' meters.']);
end

% (f)
figure;
plot(x,y);
xlabel('Distance (m)');
ylabel('Ball Height (m)');
title('Ball Trajectory');

hold on
plot(linspace(0,max(x),10),zeros(1,10),'k--');

