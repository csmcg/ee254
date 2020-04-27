%% Class_27_Outline: Numerical Integrations of Functions

%% Authorship
% * File: Class_27_Outline.m
% * Copy: Copyright (c) 2020 Gregory Myers
% * BlazerID: gmyers
% * Vers: 1.0.0 04/21/2020 GCM - Presented Spring 2020 to EE254 Section2F
% * Desc: Driver for testing concepts in Class_27_Outline.m 

%% Chapter 20: Numerical Integration of Functions
% * Understanding how Richardson extrapolation provides a means to create a more accurate integral estimate by combining two less accurate estimates.
% * Understanding how Gauss quadrature provides superior integral estimates by picking optimal abscissas at which to evaluate the function.
% * Knowing how to use MATLAB’s built-in function integral to integrate functions. 

%% 20.1 Introduction
% 

%% 20.2 Romberg Integration
%

%% 20.2.1 Richardson Extrapolation
%
% See Example 20.1

syms x;
y = .2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
y_h = matlabFunction(y);
y_double_prime = diff(diff(y));
y_dp_h = matlabFunction(y_double_prime);
xmin = 0;
xmax = 0.8;

Area_actual = integral(y_h, xmin, xmax);

for n = [0 : 9]
    % halve the interval every iteration
    [Area(n+1), Error(n+1)] = trapezoidal_with_error(y_h, y_dp_h, xmin, xmax, 2^n);
    xdelta(n+1) = (xmax - xmin) / (2^n);
end

plot(xdelta, Area)
plot(xdelta, Error)

% plotted Area/Error as function of xdelta



e_t = Area - Area_actual;
plot(1:length(Area), e_t);
% use the weights to calcualte a better approximation using i, i+1
% integration approximations

Area_v2 = (4/3)*(Area(2:end)) - (1/3)*(Area(1:end-1));
e_t_v2 = Area_v2 - Area_actual;
hold on;
plot(1:length(Area_v2), e_t_v2);
Area_v3 = (16/15)*(Area_v2(2:end)) - (1/15)*(Area_v2(1:end-1));
e_t_v3 = Area_v3 - Area_actual;
hold on;
plot(1:length(Area_v3), e_t_v3);

% Do P20.1

% See Example 20.2
%

%% 20.2.2 The Romberg Integraion Algorithm
%
% See Figure 20.1
%

%% 20.3 Gauss Quadrature
%
% See Figure 20.3
%

%% 20.3.1 Method of Undetermined Coefficients
%
% See Figure 20.4
%

%% 20.3.2 Derivation of the Two-Point Gauss-Legendre Formula
%
% See Figure 20.5
%





% See Example 20.3
%
% See Table 20.1
%

%% 20.3.3 Higher-Point Formulas
%
%% See Example 20.4
%

%% 20.4 Adaptive Quadrature
%

%% 20.4.1 Matlab M-file: quadadapt
%
% See Figure 20.6
%

%% 20.4.2 Matlab Functions: quad and quadl
% 
% See Example 20.5: Adaptive Quadrature
%

x = [0 : .001 : 1];
y = humps(x);
plot(x,y);

Area = integral(@(x) humps(x), 0, 1);

xmin = 0;
xmax = pi;
xdelta = (xmax - xmin) / 128;

x_v = [xmin : xdelta : xmax];
y_v = sin(x_v);
plot(x_v, y_v);
grid on;

Area_actual = integral(@(x) sin(x),xmin, xmax);
Area_approx = .5 * (y_v(1:end-1) + y_v(2:end)) * xdelta; % trapezoidal, xdelta = pi/128, area = 1.999

xmin = 0;
xmax = 1;
xdelta = (xmax - xmin) / 10;
x_v = [xmin : xdelta : xmax];
y_v = humps(x_v);
plot(x_v, y_v);

Area_actual = integral(@(x) humps(x),xmin, xmax)
Area_approx = sum(.5 * (y_v(1:end-1) + y_v(2:end)) * xdelta) % trapezoidal



%% Case Study: Root-Mean-Square Current
% 
% See Table 20.2




