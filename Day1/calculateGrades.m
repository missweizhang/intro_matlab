% MIT 6.057 Intro Matlab 
% Homework 1
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/assignments/MIT6_057IAP19_hw1.pdf
%

%% Problem 8 Manipulating Variables

% (b)
load classGrades;

% (c)
namesAndGrades(1:5, :)

% (d)
grades = namesAndGrades(:, 2:end);

% (e) calculate mean for each assignment
meanGrades = mean(grades)
assert( isequalwithequalnans( mean(grades), mean(grades,'includenan') ) );

meanGrades = mean(grades, 'omitnan')
% nanmean(grades) % requires Financial Toolbox, or 
                  %          Statistics and Machine Learning Toolbox
                  
% (f) curve so that mean grade is 3.5/5.
meanMatrix = ones(15,1) * meanGrades
curvedGrades = 3.5 * grades ./meanMatrix;
mean(curvedGrades, 'omitnan')
curvedGrades( curvedGrades > 5 ) = 5;

% (g) assign letter grade for each student
totalGrade = mean(curvedGrades, 2, 'omitnan');
letters = 'FDCBA';
letterGrade = letters( ceil( totalGrade ) );
disp( ['Grades: ', letterGrade] );
