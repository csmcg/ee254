%% Class_11_Outline: Numerical Integration

%% Authorship
% * File: Class_11_Outline.m
% * Copy: Copyright (c) 2020 Gregory Myers
% * BlazerID: gmyers
% * Vers: 1.0.0 02/20/2020 GCM - Presented Spring 2020 to EE254 Section2F
% * Desc: Driver for testing concepts in Class_11_Outline.m 

%% Chapter 19 Numerical Integration Formulas

%% 19.1 Introduction and Background
%
% 19.1.1 What is Integration?
% summation of area under a curve



% 19.1.2 Integration in Engineering and Science
% 
% volume integral (physical quantity) - total amount of mass over a given
% volume where concentration/density is a function of x,y and z.
% 
% area integral - total rate of energy transfer across a plane where the
% flux(in calories per square centimeter per second) is a function of
% position

%% 19.2 Newton-Coates Formulas
%
% open vs. closed forms
%   closed form - where the data points at the beginning and the end of the
%   integration are known
%   open form - have integration limits that extend beyond the range of the
%   data

%% 19.3 The Trapezoidal Rule
% 

sample_01 = @(x) sin(x);
sample_01_double_prime = @(x) -sin(x);
[area_current, error] = trapezoidal_with_error(@sample_01,@sample_01_double_prime, 0, pi, 10);

sample_02 = @(x) (.2 + 25*x - (200*x^2) + (675*x^3) - (900*x^4) + (400*x^5));
sample_02_single_prime = @(x) ((-400*x) + (2025*x^2) - (3600*x^3) + (2000*x^4));
sample_02_double_prime = @(x) (-400 + 4050*x - 10800*x^2 + 8000*x^3);
sample_02_quadruple_prime = @(x) (21600 + 48000*x);

[area_current, error] = trapezoidal_with_error(sample_02, sample_02_double_prime, 0, .8, 1);
[area_current, error] = trapezoidal_with_error(sample_02, sample_02_double_prime, 0, .8, 2);
[area_current, error] = trapezoidal_with_error(sample_02, sample_02_double_prime, 0, .8, 3);
[area_current, error] = trapezoidal_with_error(sample_02, sample_02_double_prime, 0, .8, 4);

% where are we going:
% start off with a nmin
% continue incrementing the n until we meet a convergence threshold based
%   on successive iterations
threshold = 0.001;
area_delta = threshold * 2; % preset to allow loop to run once
ncurrent = 0;
area_current = 0;
area_previous = 0;
area_n = [];
error_n = [];

while (area_delta > threshold)
    ncurrent = ncurrent + 1;    
    % call the trap. w/ error function using function handles
    [area_current, error] = trapezoidal_with_error(sample_02, sample_02_double_prime, 0, .8, ncurrent);
    area_n(ncurrent) = area_current;
    error_n(ncurrent) = error;
    
    area_delta = area_current - area_previous;
    area_previous = area_current;
end

% 19.3.1 Error in the Trapezoidal Rule
%
% 19.3.2 The Composite Trapezoidal Rule
%
% composite or multi-segment integration formulas
%
% 19.3.3 Matlab M-file: trap
v=@(t) sqrt(9.81*68.1/0.25)*tanh(sqrt(9.81*0.25/68.1)*t)
format long
trap(v,0,3,5) % 41.869929590727352
trap(v,0,3,10000) % 41.948049999175282

%% 19.4 Simpson's Rules
% 
% 19.4.1 Simpson's 1/3 Rule
% second order, parabola
%
threshold = 0.001;
area_delta = threshold * 2; % preset to allow loop to run once
ncurrent = 0;
area_current = 0;
area_previous = 0;
area_n = [];
error_n = [];

while (area_delta > threshold)
    ncurrent = ncurrent + 1;    
    % call the trap. w/ error function using function handles
    [area_current, error] = Simpson_one_third_with_error(sample_02, sample_02_quadruple_prime, 0, .8, ncurrent);
    area_n(ncurrent) = area_current;
    error_n(ncurrent) = error;
    
    area_delta = area_current - area_previous;
    area_previous = area_current;
end


% 19.4.2 The Composite Simpson's Rule
% 
% 19.4.3 Simplson's 3/8 Rule
%