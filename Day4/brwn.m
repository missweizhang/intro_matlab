% MIT 6.057 Intro MATLAB
% Lecture 4
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/lecture-notes/MIT6_057IAP19_lec4.pdf

%% slide 7 Probability
% simulate brownian motion

numTimesVisited = zeros(1, 10001); % number of times each position was visited
initPos = ceil( length(numTimesVisited) / 2 ); % middle of vector represents pos 0

% initial position
pos = initPos;
numTimesVisited(pos) = 1;

% brownian motion
positions = zeros(1,100000);
for t = 1:length(positions)
    if rand() > 0.5
        pos = pos - 1; % go left
    else
        pos = pos + 1; % go right
    end
    positions(t) = pos;
    numTimesVisited(pos) = numTimesVisited(pos) + 1;
end

figure('WindowState','fullscreen');

subplot(1,2,1)
plot(positions - initPos);
xlabel('time');
ylabel('position');
title('Brownian motion trajectory')

subplot(1,2,2)
histogram(positions - initPos, 50);
xlabel('position');
ylabel('times visited');
title('Brownian motion histogram')