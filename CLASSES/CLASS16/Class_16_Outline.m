%% Class_16_Outline: Numerical Differentiation

%% Authorship
% * File: Class_16_Outline.m
% * Copy: Copyright (c) 2020 Gregory Myers
% * BlazerID: gmyers
% * Vers: 1.0.0 03/05/2020 GCM - Presented Spring 2020 to EE254 Section2F
% * Desc: Driver for testing concepts in Class_16_Outline.m 

%% Chapter 4: Roundoff and Trucation Errors
% Revisited...

%% 4.3 Truncation Errors
% 
% 4.3.1 The Taylor Series
% Taylor Theorem states that any smooth function can be approximated as a
% polynomial.

syms x;
y = cos(x);
%[y_approx, Error, Taylor, Remainder ] = Taylor_Series_Expansion_with_error(y, pi/4, pi/3, 0);
%[y_approx, Error, Taylor, Remainder ] = Taylor_Series_Expansion_with_error(y, pi/4, pi/3, 1);
%[y_approx, Error, Taylor, Remainder ] = Taylor_Series_Expansion_with_error(y, pi/4, pi/3, 2);

for n_current = [0:1:6]
    [y_approxs(n_current+1), Errors(n_current+1), Taylors(n_current+1), Remainders(n_current+1)] ...
        = Taylor_Series_Expansion_with_error(y, pi/4, pi/3, n_current);
end

% 4.3.2 The remainder of the Taylor Series Expansion
%
% 4.3.3 Using the Taylor Series to Estimate Truncation Errors
%
% 4.3.4 Numerical Differentiation
% forward difference method
% backward difference method
% center difference method







%% Chapter 21: Numerical Differentiation
% Chapter Objectives
% The primary objective of this chapter is to introduce you to numerical
% differentiation.  Specific objectives and topics covered are
% 
% * Understanding the application of high-accuracy numerical 
%   differentiation formulas for equispaced data.
% * Knowing how to evaluate derivatives for unequally spaced data.
% * Understanding how Richardson extrapolation is applied for numerical 
%   differentiation.
% * Recognizing the sensitivity of numerical differentiation to data error.
% * Knowing how to evaluate derivatives in MATLAB with the diff and 
%   gradient functions.
% * Knowing how to generate contour plots and vector fields with MATLAB.

%% 21.1 Introduction and Background
%
% 21.1.1 What is differentiation?
% 
% 21.1.2 Differentiation in Engineering and Science
%

%% 21.2 High-accuracy differentiation formulas
%

%% 21.3 Richardson Extrapolation
%

%% 21.4 Derivatives of Unequally Spaced Data
% slight change in the formulas (eq. 21.21)



%% 21.5 Derivatives and Integrals for Data with Errors
% 

%% 21.6 Partial Derivatives
% using symbolic toolbox we can take the derivative of f(x,y) w.r.t. either
% x or y 
% Eq. 21.22 (w.r.t x) and 21.23 (w.r.t y)
% ^ center diff. method and 
% See the case study


%% 21.7 Numerical Differentiation with Mathlab
% 
% 21.7.1 Matlab function: diff
% https://www.mathworks.com/help/matlab/ref/diff.html
% See Example 21.4: Using diff for differentiation.

% start off with x and y = f(x) being length n...
% derivative would be n-1 length 

% 
% 21.7.2 Matlab function: gradient
% https://www.mathworks.com/help/matlab/ref/gradient.html
% See Example 21.5: Using gradient for differentiation.

syms x;
y = .2 * + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
y_prime = diff(y);

x_vector = [0 : .1 : .8]; 
y_actual = eval(subs(y, x, x_vector)); % 1x9
y_prime_actual = eval(subs(y_prime, x, x_vector)); %1x9

y_prime_approx = diff(y_actual) ./ diff(x_vector); % 1x8, slope b/t each point
% create a vector using midpoints that is n-1 in length
x_mid_vector = (x_vector(1:end-1) + x_vector(2:end)) / 2; % midpoint between each val in x_vector
% run thru y_prime
y_prime_mid_actual = eval(subs(y_prime, x, x_mid_vector));

Error = (y_prime_mid_actual - y_prime_approx)

% now look at GRADIENT
% ch 21.5

y_handle = matlabFunction(y);
x = [0:.1:.8];
y = y_handle(x); % 1x9 vector, double
dy = gradient(y, .1) % 1x9 vector, double
Error = y_prime_actual - dy

%% 21.8 Case Study: Visualizing Fields
% quiver
% https://www.mathworks.com/help/matlab/ref/quiver.html

syms x y;
z = y - x - (2*x^2) - (2*x*y) - (y^2);
f = matlabFunction(z);

[X, Y] = meshgrid([-2:.25:0], [1:.25:3]); 
Z = f(X,Y);

[fX, fY] = gradient(Z, .25);
cs = contour(X, Y, Z);
clabel(cs)
hold on
quiver(X, Y, -fX, -fY)

% symbolic
fx = diff(z, x) % partial w.r.t x
fy = diff(z, y) % partial w.r.t y

