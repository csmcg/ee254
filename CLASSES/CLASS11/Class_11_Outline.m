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
trapezoidal_with_error(@sample_01,@sample_01_double_prime, 0, pi, 10);



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
% 19.4.2 The Composite Simpson's Rule
% 
% 19.4.3 Simplson's 3/8 Rule
%





 



