% MIT 6.057 Introduction to Matlab
% 
% Lecture 1 Exercises
% Scripts, Variables, Basic Plotting
% 
% https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/lecture-notes/MIT6_057IAP19_lec1.pdf
%

%% scripts (slide 14)

disp('Hello world!')
disp('I''m going to learn Matlab!')

%% variables (slide 26)

load startTime
disp(['I started learning Matlab on ' startString])

%% constants (slide 36)

secPerMin = 60;
secPerHour = 60 * secPerMin;
secPerDay = 24 * secPerHour;
secPerMonth = 30.5 * secPerDay;
secPerYear = 12 * secPerMonth;

%% scalars (slide 31)

tau = 1.5 * secPerDay; % 1.5 days in seconds
endOfClass = 5 * secPerDay; % 5 days in seconds

knowledgeAtEnd = 1 - exp( - endOfClass / tau );
disp(['At the end of this class, I will know ' ...
      num2str( round( knowledgeAtEnd *100, 1 ) ) '% of Matlab.'])
  
%% vector operations (slide 36) 

secondConversion = [secPerYear, secPerMonth, secPerDay, ...
                    secPerHour, secPerMin, 1];

currentTime = clock();
elapsedTime = currentTime - start;
% t = sum(elapsedTime .* secondConversion);
t = dot(elapsedTime, secondConversion);
currentKnowledge = 1 - exp( - t / tau );
disp(['At this time, I know ' ...
      num2str( round( currentKnowledge * 100, 1 ) ) '% of Matlab.'])

%% calculate your learning trajectory (slide 42)

tVec = linspace(0, endOfClass, 10000 ); % time in seconds
knowledgeVec = 1 - exp( - tVec ./ tau );

%% indexing (slide 47)

[delta, ind] = min( abs( knowledgeVec - 0.5) );
halfTime = tVec( ind );
disp([ 'I will know half of Matlab after ' ...
       num2str( round( halfTime / secPerDay ) ) ' day.' ]);
   
%% plotting (lecture 1 slide 51, lecture 2 slide 5)

figure 
plot( tVec / secPerDay, knowledgeVec);
xlabel('days');
ylabel('knowledge');
title('Matlab learning trajectory');
