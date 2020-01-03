%% Problem 5 Fun with find

function ind = findNearest(x, desiredVal)
% return the index of the value that is nearest to a desired value in
% matrix x

    Q = abs( x - desiredVal );
    m = min( Q(:) );
    ind = find( Q == m );

end
