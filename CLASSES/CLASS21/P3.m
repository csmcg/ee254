%% eqs to test
% polynomial from book: (-.1*x^4) - (.15*x^3) - (.5*x^2) - (.25*x) + 1.2;
% cos(x)
% linear (3x)
% tan(x)
% step function (floor, ceil, etc)

% graphs of the error:
% multiple graphs (10)
% 1 - first estimations, 1st deriv of each of 3 methods
%   forward vs backward vs center vs actual
% 2 - second estimations, 1st dervi of each of 3 methods
%   forward vs backward vs center vs actual
% 3 - first estimations, 2nd deriv of each of 3 methods
%   forward vs backward vs center vs actual
% 4 - second estimations, 2nd dervi of each of 3 methods
%   forward vs backward vs center vs actual 

% compare 1st derivative methods
%   5 - first vs second vs actual (forward)
%   6 - first vs second vs actual (backward)
%   7 - first vs second vs actual (center)

% compare 2nd derivative methods
%   8 - first vs second vs actual (forward)
%   9 - first vs second vs actual (backward)
%  10 - first vs second vs actual (center)


clear;clc;close all;
syms x;
% testing functions
polynomial = (-.1*x^4) - (.15*x^3) - (.5*x^2) - (.25*x) + 1.2;
cosine = cos(x);
linear = 3*x;
tangent = tan(x);
%heaviside = heaviside(x);

xmin = 0;
xdelta = .1;
xmax = 10;

x_vector = [xmin : xdelta : xmax];

results_poly = Compare_Difference_Formulas(polynomial, xmin, xmax, xdelta);

poly_h = matlabFunction(polynomial);
lin_h = matlabFunction(linear);


figure % plot function itself, 1st deriv actual, 1st deriv method 1, 1st deriv
plot(x_vector, poly_h(x_vector), x_vector(2:end-1), results_poly{1,1}, x_vector(2:end-1), results_poly{1,2}, x_vector(3:end-2), results_poly{1,4});


figure
results_cos = Compare_Difference_Formulas(cosine, xmin, xmax, xdelta);
plot(x_vector, cos(x_vector), x_vector(2:end-1), results_cos{1,1}, x_vector(2:end-1), results_cos{1,2})
figure
results_linear = Compare_Difference_Formulas(linear, xmin, xmax, xdelta);
plot(x_vector, lin_h(x_vector), x_vector(2:end-1), results_linear{1,1}, x_vector(2:end-1), results_linear{1,2});
figure
results_tangent = Compare_Difference_Formulas(tangent, xmin, xmax, xdelta);
plot(x_vector, tan(x_vector), x_vector(2:end-1), results_tangent{1,1}, x_vector(2:end-1), results_tangent{1,2});
%figure
%results_floor = Compare_Difference_Formulas(floor_function, xmin, xmax, xdelta);
%plot(x_vector, floor(x), x_vector(2:end-1), results_floor{1,1}, x_vector(2:end-1), results_floor{1,2});