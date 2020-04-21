%% Class_22_Outline: Roots (Ch. 5)

%% Authorship
% * File: Class_22_Outline.m
% * Copy: Copyright (c) 2020 Gregory Myers
% * BlazerID: gmyers
% * Vers: 1.0.0 04/02/2020 GCM - Presented Spring 2020 to EE254 Section2F
% * Desc: Driver for testing concepts in Class_22_Outline.m 

%% Chapter 5: Roots: Bracketing Method
%

%% 5.1 Roots in Engineering and Science
% See Table 5.1: Fundamental Principles used in design problems.

%% 5.2 Graphical Methods
% See Example 5.1: The Graphical Approach

%% 5.3 Bracketing Methods and Initial Guesses
% Help define an interval [a,b] in which f(x) = 0

% See Figure 5.1
% See Figure 5.2

%% 5.3.1 Incremental Search
% See Figure 5.3
% See Example 5.2

x = [3 : 0.01 : 6];
y = sin(10*x) + cos(3*x);
subplot(2,1,1);
plot(x,y);
grid on;

results = (y > 0); % logical 
subplot(2,1,2);
plot(x, results);

results = y ./ abs(y); % get either 1 (y>0), NaN (y / 0), or -1 (y < 0)
subplot(2,1,2);
plot(x, results);

results == 1; % positive
results == -1; % negative

m = results(2:end) - results(1:end-1) % results = -2, 0, 2
subplot(2,1,2);
plot(x(2:end), m);
% count up number of 2's and -2's = number of sign changes
% 2 = neg to pos
% -2 = pos to neg

num_roots = sum(m == 2) + sum(m == -2);


%% 5.4 Bisection
% Example 5.3: The Bisection Method
%
% Example 5.4: Error Estimation for Bisection
%

% 5.4.1 Matlab M-files
% See Figure 5.7

%% 5.5 False Position
% See Figure 5.8
% See Example 5.5: The False-Position Method
%
% See Example 5.6: A Case Where Bisection is Preferable to False Position

%% 5.6 Case Study: Greenhouse Gasses and Rainwater

%% Problems:
% Problem 5.1