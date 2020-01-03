% MIT 6.057 Intro Matlab 
% Homework 1
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/assignments/MIT6_057IAP19_hw1.pdf
%
% problems 1-6

%% Problem 1 Scalar variables

a = 10;
b = 2.5e23;

c = 2 + 3i; % i = j = sqrt(-1)
c2 = complex(2,3);
assert(c == c2);

d = exp( 1j * 2 * pi / 3); % i = j = sqrt(-1)
d2 = exp( complex(0, 2*pi/3) );
assert(d == d2);

%% Problem 2 Vector variables

aVec = [3.14 15 9 26];
bVec = [2.71 8 28 182].';
cVec = 5 : -0.2 : -5;
dVec = logspace(0, 1, 101);
eVec = 'Hello';

%% Problem 3 Matrix variables

% uniform matrix
aMat = ones(9,9) * 2;
aMat1 = zeros(9,9) + 2;
assert( isequal( aMat, aMat1 ) );

% diagonal matrix
bMat = diag([ 1:5, 4:-1:1 ]);

% matrix of consecutive numbers
cMat = reshape( 1:100, 10, [] ); % 10 rows
cMat1 = reshape( 1:100, [], 10 ); % 10 columns
cMat2 = reshape( 1:100, [10, 10] ); % 10*10 matrix
assert( isequal( cMat, cMat1 ) );
assert( isequal( cMat, cMat2 ) );

% NaN, not a number
dMat = nan(3,4);

% matrix initialized to particular values
eMat = [13, -1, 5; 
        -22, 10, -87];

% matrix of random integers    
rng('default'); % control random seed
fMat = floor( rand(5,3) * 7 ) - 3;
rng('default'); % ensure identical random seed
fMat1 = ceil( rand(5,3) * 7 ) - 4;
rng('default'); % ensure identical random seed
fMat2 = randi([-3,3], 5,3);

assert( isequal( fMat, fMat1 ) );  % all elements equal
assert( isequal( fMat, fMat2 ) );  % all elements equal

rng('shuffle'); % reset random seed to current time


%% Problem 4 Scalar equations

x = 1 / ( 1 + exp( ( 15 - a ) / 6 ) );

y = ( sqrt( a ) + nthroot( b, 21 ) ) ^ pi;
y2 = ( sqrt( a ) + b^( 1/21 ) ) ^ pi;

if b < 0 % negative base, fraction power might be complex
    % b^(1/21) might be complex
    % nthroot(b, 21) odd integer root is real
    assert( y ~= y2l, ...
           ['When base is negative, fractional power and nthroot yielded' , ...
            'same results, when one should be real and the other complex!'] );
else % positive base, fraction root is real
    % b^(1/21) == nthroot(b, 21)
    assert( y == y2, ['When base is positive, ', ...
                      'fractional power and nthroot should yield the same results'] );
end

z =   log( real( c^2 - d^2 ) * sin( a * pi / 3 ) ) ...
    / c * conj(c);

% other ways of writing the complex conjugate product
assert( sqrt( c * conj(c) ) == abs(c) );
assert( ( c * conj(c) ) == ( real(c)^2 + imag(c)^2 ) )

%% Problem 5 Matrix equations

% (a)
xMat = aVec * bVec * aMat^2;

% dot product
if size(aVec,2) == size(bVec,1) && ...
   size(aVec,1) == 1 && size(bVec,2) == 1  % row and column vectors
    assert( aVec * bVec == dot(aVec, bVec) );
elseif all( size(aVec) == size(bVec) )
    assert( dot(aVec, bVec) == sum( aVec .* bVec ) );
end

% square of constant matrix (all elements equal)
if ~isempty( aMat ) && ...
   ~diff( size( aMat ) ) && ... % square matrix
   isequal( aMat, aMat(1,1) * ones( size(aMat) ) ) % all elements equal
    assert( isequal( aMat ^ 2, ...
                     size( aMat, 1 ) * aMat(1,1)^2 * ... % scalar factor
                     ones( size(aMat) ) ... % constant matrix
                    ) );
end

% (b)
yMat = bVec * aVec;

% tensor product
if size(aVec,2) == size(bVec,1) && ...
   size(aVec,1) == 1 && size(bVec,2) == 1  % row and column vectors
    assert( isequal( bVec * aVec, kron( bVec, aVec ) ) );
end

% (c)
zMat = det(cMat) * (aMat * bMat).';

%% Problem 6 Common functions and indexing

% (a)
cSum = sum( cMat ); % colulmn-wise sum, a row vector

% (b)
eMean = mean( eMat, 2 ); % row-wise mean, a column vector

% (c)
eMat(1, :) = ones(1,3);

% (d)
cSub = cMat(2:9, 2:9);

% (e)
lin = 1:20;
lin( 2 : 2 : end ) = -lin( 2 : 2 : end ); % indexing

% using logical array is more cumbersome
lin2 = 1:20;
lin2 = ( ( mod(lin2,2)==1 ) - ( mod(lin2,2)==0 ) ).*(lin2);
assert( isequal(lin, lin2) );

lin3 = 1:20;
lin3( mod(lin3,2)==0 ) = -lin3( mod(lin3,2)==0 );
assert( isequal(lin, lin3) );

% (f)
r = rand( 1, 5 );
r( find( r < 0.5 ) ) = 0;

% logical indexing is faster
r2 = rand( 1, 5 );
r2( r2 < 0.5) = 0;
