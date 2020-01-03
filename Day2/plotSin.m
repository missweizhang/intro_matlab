% MIT 6.057 Intro Matlab
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/lecture-notes/MIT6_057IAP19_lec2.pdf

%% lecture 2 slides 11, 17, 29, 37

function plotSin( f1, f2 )

x = linspace( 0, 2*pi, ceil( 16 * f1 ) );

if nargin == 1
    plotSinHelper( x, f1 )
    xlim( [ 0, 2*pi ] );

elseif nargin == 2
    y = linspace( 0, 2*pi, ceil( 16 * f2 ) );
    [X,Y] = meshgrid(x,y);
    Z = sin( f1 * X ) .* sin( f2 * Y );

    subplot(2,1,1);
    imagesc(x,y,Z);
    colormap(hot);
    colorbar;
    axis('xy');
    title( compose('plotSin(%d, %d)', f1, f2 ) );
    
    subplot(2,1,2);
    surf(x,y,Z);

else
    error('One or two inputs required.');
end

end

%% helper function

function plotSinHelper( x, f )
plot( x, sin( f * x ), 'r--s', ... % red dashed line, square markers
    'LineWidth', 2, ...
    'MarkerFaceColor', 'k' ... % black marker face
    );
title( compose('plotSin(%d)', f) )
end
