%% Problem 8(b) Concentric circles

N = 7; % number of circles
colors = jet(N); % colors

for n = 1 : N
    % get coordinates
    [x, y] = getCircle([0,0], n);
    
    % plot circle
    plot( x, y, '-', 'LineWidth', 3, ...
        'Color', colors(n,:) );
    hold on;
end

hold off;
axis equal
