%% Problem 6 Loops and flow control

function loopTest(N)
% display if integers 1 through N are divisible by 2 and/or 3

for n = 1:N
    if mod( n, 6 ) == 0
        disp( [num2str(n), ' is divisible by 2 AND 3'] );
    elseif mod( n, 2 ) == 0
        disp( [num2str(n), ' is divisible by 2'] );
    elseif mod( n, 3 ) == 0
        disp( [num2str(n), ' is divisible by 3'] );
    else
        disp( [num2str(n), ' is NOT divisible by 2 or 3'] );
    end
end

end