%% Problem 8(c) Draw Olympic logo

[x, y] = getCircle([0,0], 0.45);
plot( x, y, 'k-', 'LineWidth', 3);
hold on;

[x, y] = getCircle([-1,0], 0.45);
plot( x, y, 'b-', 'LineWidth', 3);
hold on;

[x, y] = getCircle([1,0], 0.45);
plot( x, y, 'r-', 'LineWidth', 3);
hold on;

[x, y] = getCircle([-0.5, -0.45], 0.45);
plot( x, y, 'y-', 'LineWidth', 3);
hold on;

[x, y] = getCircle([0.5, -0.45], 0.45);
plot( x, y, 'g-', 'LineWidth', 3);
hold on;

hold off
axis equal
