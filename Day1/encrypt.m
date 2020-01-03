% MIT 6.057 Intro Matlab
% Homework 1
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/assignments/MIT6_057IAP19_hw1.pdf
%

%% Optional Problem 3 Encryption Algorithm
original = 'This is my top secret message!';

key = randperm( length( original ) );
encoded = original( key );

temp = [ key; 1 : length( original ) ].';
temp = sortrows( temp, 1 );
dkeys = temp( :, 2 );

decoded = encoded( dkeys );

disp( ['Original: ', original] );
disp( ['Encoded: ', encoded] );
disp( ['Decoded: ', decoded] );

correct = strcmp(original, decoded);

disp( ['Decoded correctly (1 true, 0 false): ', num2str(correct)] );