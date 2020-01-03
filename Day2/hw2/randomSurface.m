%% Problem 4 Interpolation and surface plots

Z0 = rand(5);
[X0, Y0] = meshgrid(1:5);

% interpolation
[X1, Y1] = meshgrid(1:0.1:5);
Z1 = interp2(X0, Y0, Z0, X1, Y1, 'cubic');

figure;
surf(X1, Y1, Z1);
colormap(hsv);
shading('interp');
hold on

contour(X1, Y1, Z1);
colorbar;
caxis([0, 1]);