%% Draw Rainbow

% RGB colors
% red = [1,0,0];
% orange = [1,0.5,0];
% yellow = [1,1,0];
% green = [0,1,0];
% cyan = [0,1,1];
% blue = [0,0,1];
% purple = [0.5,0,1];
% rainbowColors = [ red; orange; yellow; green; cyan; blue; purple ]

rainbowColors = flip( jet(7) );

% polar and cartesian coordinates for semicircles
angle = linspace(0, pi, 50);
x = cos(angle);
y = sin(angle);

% concentric semicircles
radius = linspace(12, 10, length(rainbowColors) );

% draw
figure('WindowState', 'maximized');

for iColor = 1:length(rainbowColors)
    r = radius( iColor );
    plot( r * x, r * y, ...
         'r-', 'LineWidth', 7, ...
         'Color', rainbowColors( iColor, : ) );
    hold on
end

hold off
ylim([2, 12.2]);
axis equal;
title('Rainbow for Mimi');
