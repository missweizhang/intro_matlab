% MIT 6.057 Intro MATLAB
% Lecture 4
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/lecture-notes/MIT6_057IAP19_lec4.pdf

%% slide 12 Cell arrays vs String arrays
% generate a sentence

if 0 % string array ()
% As of R2018b, the recommended way to store text is to use string arrays. 
    data = ["Matthew", "Mark", "Luke", "John"; % names
            "patient", "kind", "meek", "pure in heart"] % adjectives

    disp(join([ data( 1, randi([1,4]) ), 'is', data( 2, randi([1,4]) ) ])); 
    
elseif 0 % cell array {}
    
    data = {'Matthew', 'Mark', 'Luke', 'John'; % names
            "patient", "kind", "meek", "pure in heart"} % adjectives
    disp( [ data{ 1, randi([1,4]) }, ' is ', data{ 2, randi([1,4]) } ] ); 

else % struct
    olddata = ["Matthew", "Mark", "Luke", "John"; % names
               "patient", "kind", "meek", "pure in heart"] % adjectives
    data.name = olddata(1,:);
    data.adj  = olddata(2,:);
    disp(join([ data.name( randi([1,4]) ), 'is', data.adj( randi([1,4]) ) ])); 
end
