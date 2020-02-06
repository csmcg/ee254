%% Class_06_Outline: Functions and Control of Flow Examples
% File: Class_06_Outline.m
% Copy: Copyright (c) 2020 Gregory C. Myers
% BlazerID: gmyers
% Vers: 1.0.0 01/30/2020 GCM - Presented Spring 2020 to EE254 Section2F
% Desc: Driver for testing concepts in Class_06_Outline.m 

% User defined functions (Chapra 3.1.2)
 % 0 or more input and output arguments
 % pi()  - accepts zero arguments
 % now() - # of ticks/seconds 
 
 % example: [area, perimeter] = GetCircleProperties(radius)
 % 

% Variable Scope (Chapra 3.1.3)

% Global Variables (Chapra 3.1.4)

% Subfunctions (Chapra 3.1.5)
  % for the function to be seen outside of the file, the function name must
  %   match the file name
  % subfunction - hidden function inside another file
  %   not publicly accessible

% Example: Problem 3.5
%   [ value, error ] = approximate_sine( x, n )


% Example: Problem 3.8
%   grade = lettergrade( score )



% Example: Problem 3.18
%   [ properties ] = get_properties( FormulaHandle, xmin, xmax, xdelta )

results = get_properties(@function_01, 0, 1, .01);
results = get_properties(@function_02, 0, 2*pi, pi/16);

% Assignment: Complete a documented Matlab script/function for each of the
% followiing:
%   Problem 2.11 --> Problem_2_11
%   Problem 2.13 --> Problem_2_13
%   Problem 2.20 --> [ value, error ] = approximate_cosine( x, n )
%   Problem 3.5 
%   Problem 3.6 
%       [ r, theta ] = cartesian_to_polar( x, y )
%       note: scalar
%   Problem 3.7 
%       [ r, theta ] = cartesian_to_polar( x, y )
%       note: vector
%   Problem 3.8
%   Problem 3.18





GetAreaByConvergenceThreshold(@SampleFunction, 0, 1, .001, uint32(10), uint32(10000))

x = [ 0 : .01 : 1 ]
y = ( 1 - x.^2 )

GetAreaWithPlot( x, y )