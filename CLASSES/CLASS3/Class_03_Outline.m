%% Class_03_Outline: Getting started with Matlab
% File: Class_03_Outline.m
% Copy: Copyright (c) 2020 Gregory C. Myers
% BlazerID: gmyers
% Vers: 1.0.0 01/21/2020 GCM - Presented Spring 2020 to EE254 Section2F
% Desc: Driver for testing concepts in Class_03_Outline.m 

%% Checklist: Done.
% Recieved Applied Numerical Methods with MATLAB for Engineers and
%   Scientists, Steven C. Chopra
% Read Chapter 1: Modeling, Computers and Error Analysis
% Installed or re-installed MATLAB R2016b (or newer).

%% Checklist: ToDo.

%% Questions:
% What does the name Matlab stand for? * MATRIX LABORATORY
% Is the Matlab language scripted or compiled? * INTERPRETED/SCRIPTED
% What are three parts of a variable? * name, value, type/class
% What is the default numeric data type in Matlab? * double (precision) -
% 64 bit
% What is the data type of my name? * 
%   char (array/vector)
%   string - newer
% What does the semi-colon do?
%   suppress output (not required)
% What are the three parts to a function signature?
%   - name
%   - input arguments (0 or many args, varargin)
%   - output arguments (0 or more - separated by commas if >= 2)

%% Basics:
% Get Familiar with the Matlab interface.

% Get Familiar with Matlab variables and naming.
%   HARD RULES:
%       alphanumberic - letters, numbers, and underscores
%       must start with letter
%       case sensitive
%       stay away from existing functions/keywords
%   SOFT RULES:
%       reasonable length variable name
%       no one letter names (i.e., mass is mass, not m)
%       use underscores or camelCase

% Get Familiar with the Matlab Help and the WebSite
% www.mathworks.com

% Language Fundamentals 
% http://www.mathworks.com/help/matlab/index.html#language-fundamentals

% Entering Commands 
% http://www.mathworks.com/help/matlab/entering-commands.html

% Operators and Elementary Operations
% http://www.mathworks.com/help/matlab/operators-and-elementary-operations.html

% Exponents and Logarithms
% http://www.mathworks.com/help/matlab/exponents-and-logarithms.html

% Trigonometry
% http://www.mathworks.com/help/matlab/trigonometry.html

% Special Characters 
% https://www.mathworks.com/help/matlab/matlab_prog/matlab-operators-and-special-characters.html

% Data Types
% http://www.mathworks.com/help/matlab/data-types_data-types.html

% Environment and Settings
% https://www.mathworks.com/help/matlab/desktop-tools-and-development-environment.html?s_tid=CRUX_lftnav

%% Vectors: Creation

% manual creation
A = [1 2 3]

% colon (:)
B = [1 : 1 : 10] % 1 x 10 
% [start : step : end]
C = [1 : 2 : 10] % 1 X 5
D = [1 : 1 : -1]
E = [10 : -1 : 1]
F = [0 : (pi/4) : (2 * pi)]

% linspace - linear distribution of values
G = linspace(0, 100, 101)

% zeros
H = zeros(1, 10)
H = zeros(10, 1)

% ones
I = ones(1, 10)
I = ones(10, 1)

% rand - Uniformly distributed pseudorandom numbers
J = rand(1,10)

% randi - Uniformly distributed pseudorandom integers
K = randi(100, 1, 10) % first arg is max, get values from 1 to max

% randn - Normally distributed pseudorandom numbers
L = randn(1, 10) % pos/neg centered around zero

% randperm - Random permutation of a collection of numbers
M = randperm(52) % no duplicates

% lazy way
N(20) = 0;

%% Vectors: Access

% length
length(F)

% size
size(F)

% index and out of bounds


%% Vectors: Operations
% Similar to scalar operations

% Arithmetic
% +,-,*,/,.^,power

% .* - multiplication
% ./ - division
% .^ - exponentiation

% LOGICAL
% true/false
% false = 0
% true = 1

% &, |
% & - AND
% && - short circuit AND
% | - OR
% || - short circuit OR

P = false;
Q = false;
P & Q; % false
P | Q; % false
~P; % true

P = false;
Q = true;
P & Q % false
P | Q % true 

P = true;
Q = true;
P & Q % true
P | Q % true

% Concatenation

R = [1 : 1 : 10]; % 1x10
S = [10 : -1 : 1]; % 1x10
[ R S ]; % horizontal concatenation
[ R ; S]; % vertical concatenation
% OR CAN USE
horzcat(R, S); % horizontal concatenation 
vertcat(R, S); % vertical concatenation
 
% Slicing 
R(1) % first value
R(2) % second value, etc....
R(1:2) % first two values
R(1:5) % first five
R((end-4) : end) % last fiv
R(end:-1:1) % reverse the array
R(1:2:end) % odd indexed values
R(2:2:end) % even indexed


% Summary of Function
% Sum, mean, median, max, min
sum(R)
mean(R)
max(R)
min(R)

%% Plotting
% https://www.mathworks.com/help/matlab/ref/plot.html
% Ex. Sine and cosine functions
x = [-2*pi : pi/32 : 2*pi]; % 1 x 129
y1 = sin(x);
plot(x,y) % x & y must be same length
hold on % freezes plot
y2 = cos(x);
plot(x,y2)
hold off % unfreeze
% as opposed to holding, you can plot multiple pairs
%plot(x,y1,x,y2)
legend('y = sin(x)', 'y = cos(x)');
xlabel('x axis');
ylabel('y axis');
title('Plot Demo');

% Ex. Exponential growth and decay

%% Publish and Share MATLAB Code
% https://www.mathworks.com/help/matlab/matlab_prog/publishing-matlab-code.html

%% Class_04_Preparation: Matrices and Arrays
% https://www.mathworks.com/help/matlab/learn_matlab/matrices-and-arrays.html

