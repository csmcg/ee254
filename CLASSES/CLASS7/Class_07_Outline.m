%% Class_07_Outline: Introduction to Numerical Error
% File: Class_07_Outline.m
% Copy: Copyright (c) 2020 Gregory C. Myers
% BlazerID: gmyers
% Vers: 1.0.0 02/04/2020 GCM - Presented Spring 2020 to EE254 Section2F
% Desc: Driver for testing concepts in Class_07_Outline.m 

%% Chapter 4: Roundoff and Truncation Errors
% Chapter Objectives
% The primary objective of this chapter is to acquaint you with the major
% sources of errors involved with numerical methods.  Specific objectives
% and topics covered are
% 
% * Understanding the distinction between accuracy and precision.
% * Learning how to quantify error.
% * Learning how error estimates can be used to decide when to terminate an 
%   iterative calculation.
% * Understanding how roundoff errors occur because digital computers have 
%   a limited ability to represent numbers.
% * Understanding why floating-point numbers have limits on their range and
%   precision.
% * Recognizing that truncation errors occur when exact mathematical 
%   formulations are represented by approximations.
% * Knowing how to use the Taylor series to estimate truncation errors.
% * Understanding how to write forward, backward, and centered 
%   finite-difference approximations of the first and second derivatives.
% * Recognizing that efforts to minimize truncation errors can sometimes 
%   increase roundoff errors.

%% 4.1 Errors

%% 4.1.1 Accuracy and Precision
% Accuracy refers to how closely a computed or measured value agrees with 
% the true value, while precision refers to how closely individual computed
% or measured values agree with each other.
% 
% * a. inaccurate and imprecise
% * b. accurate and imprecise
% * c. inaccurate and precise
% * d. accurate and precise
%
% <<Accuracy and Precision.bmp>>
%

%% 4.1.2 Error Definitions
% true (fractional) relative error
%
% relative error
%
% stopping criterion
%
% Example 4.1: Error Estimates for Iterative Methods

%% 4.1.3 Computer Algorithm for Itearive Calculatations

%% 4.2 Roundoff Errors

%% 4.2.1. Computer Number Representation
%
% Integer Representation
% binary to decimal
% 
% decimal to binary
%
% Matlab Datatypes - Integers
% 
% https://www.mathworks.com/help/matlab/matlab_prog/integers.html
%
% Floating-Point Representation
% 
%   (+/-) s x b^e
% 
% Matlab Datatypes - Floating-Point Numbers
% 
% https://www.mathworks.com/help/fixedpoint/examples/create-fixed-point-data.html
% 
% Fixed-Point Basics in Matlab
% 
% https://www.mathworks.com/help/fixedpoint/fixed-point-basics.html?s_tid=CRUX_lftnav
%
% https://www.mathworks.com/help/fixedpoint/examples/create-fixed-point-data.html
 
%% 4.2.2 arithmetic Manipulations of Computer Numbers
% 
% Large Computations
%
% Smearing
%
% Inner Products

%% 4.3 Truncation Errors

%% 4.3.1 The Taylor Series
% 
% Example 4.3: Approximation of a Function with a Taylor Series Expansion
% See page 118

% 4.3.2 The Remainder for the Taylor Series Expansion

% 4.3.3 Using the Taylor Series to Estimate Truncation Errors

% 4.3.4 Numerical Differentiation
%
% Backward Difference Approximation of the First Derivative
%
% Example 4.4: Finite-Difference Approximations of Derivatives
% See page 124
%
% Finite-Difference Approximations of Higher Derivatives
% 




