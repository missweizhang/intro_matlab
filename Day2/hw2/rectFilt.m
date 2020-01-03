%% Problems 7 and 10 Smoothing

function smoothed = rectFilt( x, width )
% x = vector of noisy data
% width = moving average window
% smoothed = vector of moving averages

if isvector(x)
    %% Problem 7 Smoothing filter
    
    % width out of range
    if width < 2
        disp( ['Warning: width must be at least 2, given ', num2str(width), '.' ] );
        smoothed = x;
        return;
    end
    if width > length(x)
        disp( ['Warning: width not be larger than length(x), given ', num2str(width), '.' ] );
        smoothed = zeros( size(x) ) + mean(x);
        return;
    end
    
    % make sure width is odd integer
    if floor(width) ~= width
        disp( ['Warning: width should be integer.  Given ', num2str(width), '.' ] );
        width = floor(width);
    end
    if mod( width, 2 ) == 0
        disp( ['Warning: width should be odd.  Given ', num2str(width), '.' ] );
        width = width + 1;
    end
    
    % smoothed(n) = mean( x(n-w : n+w) )
    w = (width - 1) / 2; % window
    
    if 0 % compute using mean, loop
        smoothed = zeros( size(x) ); % initialize
        for n = 1 : length(x)
            left = max(1, n-w);
            right = min(n+w, length(x));
            %    disp( compose('n=%d, x(%d:%d)', n, left, right) );
            smoothed(n) = mean( x( left : right ) );
        end
    else % compute using conv, vectorize
        v = ones(1, width); % conv factor
        smoothed = conv(x, v) ./ conv( ones( 1, length(x) ), v ); % moving average
        smoothed = smoothed( w + 1 : length(smoothed) - w); % truncate edges
        assert( length( smoothed ) == length(x) );
    end
    
else % input x is matrix
    %% Problem 10 Smoothing nonuniformly sampled data
 
    if size(x, 2) ~= 2
        disp( ['Error: expect data as vector or matrix of two columns, got ', size(x), '.' ] );
        return;
    end
    
%     [xmin, xmax] = bounds(x(:,1));    
%     if width > ( xmax - xmin )
%         disp( ['Warning: width not be larger than the range of x, given ', num2str(width), '.' ] );
%         smoothed = zeros( size( x(:,1) ) ) + mean( x(:,2) ); % constant value
%         smoothed = [ x(:,1), smoothed ];
%         return;
%     end
    
    % compute moving average
    smoothed = zeros( size(x) );
    for n = 1 : length(x(:,1))
        xcurr = x(n,1);
        window = ( xcurr - width / 2 ) < x(:,1) & x(:,1) < ( xcurr + width / 2 );
        xx = x( window, : );
        smoothed(n,2) = mean( xx(:,2) );
    end
    smoothed(:,1) = x(:,1);
    
    
    % range covers all the points in x(:,1)
%     range = ceil( ( xmax - xmin ) / width ) * width;
%     delta = ( range - ( xmax - xmin ) ) / 2;
%     xx = xmin - delta : width : xmax + delta;
%     yy = interp1( x(:,1), x(:,2), xx, 'pchip', 'extrap' );
%     smoothed = [ x(:,1), interp1(xx, yy, x(:,1) ) ];
        
end