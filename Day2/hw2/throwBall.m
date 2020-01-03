%% Optional Problem 9 Functions

function distance = throwBall(v, theta)
% Throwing a ball, find distance ball hits the ground
% v = initial velocity in m/s
% theta = initial velocity angle in degrees
% distance = distance ball hits the ground

GACC = 9.8; % m/s^2, gravitational constant 

initHeight = 1.5; % % initial height in m
t = linspace(0,5,1000); % time vector in s

% trajectory as a function of time
x = v *  t' * cos( theta * pi / 180 ); % distance
y =   initHeight ...
    + v * t' * sin( theta * pi / 180 ) ...
    - GACC / 2 * t'.^2; % height

ind = find( y(:) < 0 );
if isempty(ind) % not found
    distance = NaN;
    disp('Warning: ball does not hit the ground in 10 seconds.');
else
    distance = x( ind(1) );
end

end
