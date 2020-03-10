%% Class_15_Outline: Numerical Integration

%% Authorship
% * File: Class_15_Outline.m
% * Copy: Copyright (c) 2020 Gregory Myers
% * BlazerID: gmyers
% * Vers: 1.0.0 03/02/2020 GCM - Presented Spring 2020 to EE254 Section2F
% * Desc: Driver for testing concepts in Class_11_Outline.m 

%% 19.5 Higher-Order Newton Coates Forumlas
% at some point there is no increase in accuracy (Runge's Phenomenon)

x = [0: pi/16: 2*pi];
y = cos(x);
area = sum(.5 * (y(1:1:end-1) + y(2:1:end)) .* (x(2:1:end) - x(1:1:end-1)));

% same approach with 1/3 rule
x_0 = x(1:2:end - 2);
x_1 = x(2:2:end);
x_2 = x(3:2:end);

y_0 = cos(x_0);
y_1 = cos(x_1);
y_2 = cos(x_2);
xdelta = x(2:2:end) - x(1:2:end-1);

area = sum(xdelta .* ((y_0 + 4*y_1 + y_2) / 6));



%% 19.6 Integration with unequal segments
% 
% 19.6.1 Matlab M-file: trapuneq
%
% 19.6.2 Matlab Functions: trapz and cumtrapz
% trapz
% https://www.mathworks.com/help/matlab/ref/trapz.html
%
% cumtrapz
% https://www.mathworks.com/help/matlab/ref/cumtrapz.html

%% 19.7 Open Methods

%% 19.8 Multiple Integrals
%
% 19.8.1 Matlab Functions: dblquad and triplequad
% dblquad
% https://www.mathworks.com/help/matlab/ref/dblquad.html
%
% integral2
% https://www.mathworks.com/help/matlab/ref/integral2.html
%
% triplequad
% https://www.mathworks.com/help/matlab/ref/triplequad.html
%
% integral3
% https://www.mathworks.com/help/matlab/ref/integral3.html
%

% volume by values
x = [0 : pi/16: 2*pi];
y = [0 : pi/16: 2*pi];
[X Y] = meshgrid(x, y);
% z = f(x,y)
Z = cos(X) .* cos(Y);
surf(X,Y,Z)

xdelta = x(2:1:end) - x(1:1:end-1);
ydelta = y(2:1:end) - y(1:1:end-1);
zleft = Z(1:1:end-1,1:1:end-1);
for row = 1 : 1 : length(xdelta)
    for col = 1 : 1 : length(ydelta)
        area_segments(row,col) = xdelta(row)*ydelta(col);
    end
end

volume_segments = area_segments .* zleft;
volume = sum(sum(volume_segments));

%% 19.9 Case Study
% 

%% Single Integration
% inegral
% https://www.mathworks.com/help/matlab/ref/integral.html

%% Matlab Symbolic Toolkit
% https://www.mathworks.com/help/symbolic/index.html?s_tid=CRUX_lftnav
% 
% Symbolic Variables, Expressions, Functions, and Preferences
% https://www.mathworks.com/help/symbolic/symbolic-variables-expressions-and-functions.html
%
% Symblic Solvers
% https://www.mathworks.com/help/symbolic/symbolic-solvers.html
% 
% syms
% https://www.mathworks.com/help/symbolic/syms.html
%  
% Solve Algebraic Equation
% https://www.mathworks.com/help/symbolic/solve-an-algebraic-equation.html
% 
% Definite and indefinite integrals
% https://www.mathworks.com/help/symbolic/int.html
syms x
y = -2*x/(1+x^2)^2;
ind_int_y = int( y )

% Integration
% https://www.mathworks.com/help/symbolic/integration.html
def_int_y = int(y, 0, 1 )

%% Homework:
% Using 19.9 Case Study,
% 19.19: Determine the work performed by a constant force.
%   a. Plot F(x), Theta(x) on subplots
%   b. Use OUR trapezoidal function, verify against trapz and plot W vs.
%       Theta
% 19.20: Determine the work performed by a variable force.
%   a. Plot F(x), Theta(x) on subplots for x = 0 to 30 m (x_del = 1m).
%   b. Use OUR trapezoidal function, verify against trapz and plot W vs.
%       Theta