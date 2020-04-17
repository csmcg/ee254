%% Class_26_Outline: Roots

%% Authorship
% * File: Class_26_Outline.m
% * Copy: Copyright (c) 2020 Gregory Myers
% * BlazerID: gmyers
% * Vers: 1.0.0 04/14/2020 GCM - Presented Spring 2020 to EE254 Section2F
% * Desc: Driver for testing concepts in Class_26_Outline.m 

%% 6.4 Brent's Method
%

%% 6.4.1 Inverse Quadratic Interpolation
%
% Brent's Method - Oscar Veliz
% https://www.youtube.com/watch?v=-bLSRiokgFk
%
% srchbre
% 1-D interval location using Brent’s method
% https://www.mathworks.com/help/deeplearning/ref/srchbre.html
% 
% See Figure 6.8
%
% See Figure 6.9
%
% See Example 6.6
% develop quad. eq's in both x and y for data points (1,2) (2,1) (4,5)
x_vector = [1 2 4];
y_vector = [2 1 5];
syms x y;
% leverage equation 6.11
% x_i+1 (xnext) ---> x_root_approx
% x_i (xcurr)   
% y_next (y_i+1)
% y_curr (y_i)
% y_prev (y_i-1)

f_x = ((x - x_vector(2)).*(x - x_vector(3))) ./ ... 
      (((x_vector(1) - x_vector(2)) * (x_vector(1) - x_vector(3))) * y_vector(1)) ...
      ...
      + (((x-x_vector(1)) * (x_vector(3))) / ((x_vector(2) - x_vector(1)) * (x_vector(2) - x_vector(3)))) * y_vector(2) + ...
      (((x-x_vector(1)) * (x-x_vector(2))) / ((x_vector(3) - x_vector(1)) * (x_vector(3) - x_vector(2)))) * y_vector(3);

% do the same thing with g_y
% use these to determine new x_i+1




%% 6.4.2 Brent's Method Algorithm
% 
% See Figure 6.10
%

%% 6.5 Matlab Function: fzero
% 
% See Example 6.7
% fzero - roots of a nonlinear function
% optimset - sets the options for fzero
f = @(x) x.^2 - 9;
fzero(f,-4) % x_root = -3
fzero(f,-2) % ans = -3
fzero(f, 0) % ans = -3
fzero(f, 1) % ans = 3
fzero(f, .1) % ans = -3
fzero(f, [.1 4]) % ans = 3
fzero(f, [-5 5]) % ERROR, f(x) vals at interval endpoint must differ in sign



%options = optimset('Display', 'iter'); 
options = optimset('Display', 'off', 'PlotFcns', 'optimplotfval');
[x fx] = fzero(f, .1, options);

[x fx] = fzero(@(x) x^10 - 1, .5, options);

%% 6.6 Polynomials
%

%% 6.6.1 Matlab Functions: roots
%
a = [1 -3.5 2.75 2.125 -3.875 1.25];
polyval(a,1);

%% 6.7 Case Study: Pipe Friction
% 

% Exercises:
% 5.24 - Archimede's Principle, test your bisection function
% 6.19 - RLC using fzero

