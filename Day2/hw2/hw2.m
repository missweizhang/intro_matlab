%% Problem 1 Semilog plot

nStudents = [15 25 55 115 144 242];
semilogy(nStudents, 'ms', ...
         'LineWidth', 4, 'MarkerSize', 10);

xlabel('Year');
ylabel('Number of Students');
title('Semilog plot of number of students in 6.057 over the years.');
xlim([0,7]);
ylim([10,500]);

%% Problem 2 Subplot

load mitMap.mat;

figure;
subplot(2,2,1);
imagesc(mit);
colormap(cMap);
axis square;
title('square');

subplot(2,2,2)
image(mit);
colormap(cMap);
axis tight;
title('tight');

subplot(2,2,3)
imagesc(mit);
colormap(cMap);
axis equal;
title('equal');

subplot(2,2,4)
im = imagesc(mit);
colormap(cMap);
axis xy;
title('xy');

% image equivalent to imagesc
% [ min, max ] = bounds(mit,'all');
% if length(cMap) == ( double(max) - double(min) + 1 )
%     assert( isequal(imagesc(mit), image(mit) ) );
% end

%% Problem 3 Bar graph

v = rand(1,5);
figure;
bar(v, 'r');
title('Bar graph of 5 random values');

%% Problem 4 Interpolation and surface plots

randomSurface;

%% Problem 5 test Fun with find

disp( [newline, 'Testing Problem 5. Fun with find'] );
x = magic(4)
disp('findNearest(x, 8.5)');
ind = findNearest(x, 8.5);
x(ind)

disp('findNearest(x, 1)');
ind = findNearest(x, 1);
x(ind)

disp('findNearest(x, 100)');
ind = findNearest(x, 100);
x(ind)

%% Problem 6 test Loops and flow control

disp( [newline, 'Testing Problem 6 Loops and flow control'] );
loopTest(13);

%% Problem 7 test Smoothing Filter

disp( [newline, 'Testing Problem 7 Smoothing Filter'] );
load noisyData.mat

% displays errors and warnings if used incorrectly
disp('rectFilt( x, -1 )');
rectFilt( x, -1 );

disp('rectFilt( x, 2 )');
rectFilt( x, 2 );

disp('rectFilt( x, 3.5 )');
rectFilt( x, 3.5 );

% plot smoothed data
disp( [newline, 'Plotting original and smoothed data using rectFilt(x,11)...']);
figure;

plot( x, 'b.', 'DisplayName', 'Original Data' );
hold on;
plot( rectFilt( x, 11 ), 'r-', 'DisplayName', 'Smoothed' ); % smooth with window 11
hold off;

legend;
xlabel('Index');
ylabel('Data Value');
title('Smoothing Illustration');

%% Optional Problem 8 Plot a circle 

figure;
concentric;

figure;
olympic;

%% Optional Problem 9 Logical indexing and piecewise plots.

figure;
transistor;

%% Optional Problem 9 Functions

testBall;

%% Problem 10 Smoothing nonuniformly sampled data
disp( [newline, 'Testing Problem 10 Smoothing nonuniformly sampled data'] );

load optionalData.mat
smoothed = rectFilt( x, 2.0 );

figure;
plot( x(:,1), x(:,2), 'b.', 'DisplayName', 'Original Data' );
hold on;
plot( smoothed(:,1), smoothed(:,2), 'r-', 'DisplayName', 'Smoothed' );
hold off;

legend('Location', 'northwest');
xlabel('X Value');
ylabel('Y Value');
title('Smoothing Illustration, nonuniform spacing');

%% Optional Problem 11 Buy and sell a stock
disp( [newline, 'Testing Problem 11 Buy and sell a stock'] );

load googlePrices.mat
tradeStock(100000, price, lows, peaks, 1);
