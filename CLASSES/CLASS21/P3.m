%% EE254 P3 - Numerical Approaches to Derivatvies - Connor McGarty, cmcgarty
% The following project compares different methods for finding the
% derivative of functions. The following finite difference methods are 
% compared:
%
% * Forward Finite Difference, 2 terms
% * Forward Finite Difference, 3 terms
% * Backward Finite Difference, 2 terms
% * Backward Finite Difference, 3 terms
% * Center Finite Difference, 4 terms
% * Center Finite Difference, 5 terms

%% Define Testing functions
% The following 5 functions will be used to test the derivative
% approximation techniques. 
% Polynomial from book: 
% 
% $$ y = (-.1x^{4}) - (.15x^{3}) - (.5x^{2}) - (.25x) + 1.2 $$
% 
% $$ y = \cos{(x)} $$
% 
% $$ y = 3x $$
% 
% $$ y = \tan{(x)} $$
% 
% We'll also use a heaviside step function.

%% Define Testing functions

clear;clc;close all;
syms x;
poly = (-.1*x^4) - (.15*x^3) - (.5*x^2) - (.25*x) + 1.2;
cosine = cos(x);
linear = 3*x;
tangent = tan(x);
step = heaviside(x-3)*sin(2*x);

%% Setup 
xmin = 0;
xdelta = .1;
xmax = 10;

x_vector = [xmin : xdelta : xmax];

poly_h = matlabFunction(poly);
lin_h = matlabFunction(linear);
step_h = matlabFunction(step);

%% Call Compare_Difference_Formulas()
poly_res = Compare_Difference_Formulas(poly, xmin, xmax, xdelta);
cos_res = Compare_Difference_Formulas(cosine, xmin, xmax, xdelta);
linear_res = Compare_Difference_Formulas(linear, xmin, xmax, xdelta);
tangent_res = Compare_Difference_Formulas(tangent, xmin, xmax, xdelta);
step_res = Compare_Difference_Formulas(step, xmin, xmax, xdelta);

%% Forward/Backward/Center, 1st Derivative, v1
figure; % plot function itself, 1st deriv actual, 1st deriv method 1, 1st deriv
hold on;
plot(x_vector, poly_h(x_vector)); % plot the polynomial
plot(x_vector(2:end-1), poly_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), poly_res{1,2}); % 1st derivative, forward v1
plot(x_vector(2:end-1), poly_res{1,6}); % 1st deriv, backward v1
plot(x_vector(2:end-1), poly_res{1,10}); % 1st deriv, center v1
title('Forward/Backward/Center Methods, 1st Derivative - v1, Polynomial');
legend('Polynomial', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, cos(x_vector)); % plot the cosine
plot(x_vector(2:end-1), cos_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), cos_res{1,2}); % 1st derivative, forward v1
plot(x_vector(2:end-1), cos_res{1,6}); % 1st deriv, backward v1
plot(x_vector(2:end-1), cos_res{1,10}); % 1st deriv, center v1
title('Forward/Backward/Center Methods, 1st Derivative - v1, Cosine');
legend('cos(x)', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, lin_h(x_vector)); % 
plot(x_vector(2:end-1), linear_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), linear_res{1,2}); % 1st derivative, forward v1
plot(x_vector(2:end-1), linear_res{1,6}); % 1st deriv, backward v1
plot(x_vector(2:end-1), linear_res{1,10}); % 1st deriv, center v1
title('Forward/Backward/Center Methods, 1st Derivative - v1, Linear');
legend('3*x', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, tan(x_vector)); % 
plot(x_vector(2:end-1), tangent_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), tangent_res{1,2}); % 1st derivative, forward v1
plot(x_vector(2:end-1), tangent_res{1,6}); % 1st deriv, backward v1
plot(x_vector(2:end-1), tangent_res{1,10}); % 1st deriv, center v1
title('Forward/Backward/Center Methods, 1st Derivative - v1, Tangent');
legend('tan(x)', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, step_h(x_vector)); % 
plot(x_vector(2:end-1), step_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), step_res{1,2}); % 1st derivative, forward v1
plot(x_vector(2:end-1), step_res{1,6}); % 1st deriv, backward v1
plot(x_vector(2:end-1), step_res{1,10}); % 1st deriv, center v1
title('Forward/Backward/Center Methods, 1st Derivative - v1, Step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');
   
%% Forward/Backward/Center, 1st Derivative, v2
   
figure;
hold on;
plot(x_vector, poly_h(x_vector)); % 
plot(x_vector(3:end-2), poly_res{1,3}); % 1st deriv, actual
plot(x_vector(3:end-2), poly_res{1,4}); % 1st derivative, forward v2
plot(x_vector(3:end-2), poly_res{1,8}); % 1st deriv, backward v2
plot(x_vector(3:end-2), poly_res{1,12}); % 1st deriv, center v2
title('Forward/Backward/Center Methods, 1st Derivative - v2, Polynomial');
legend('Poly', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, cos(x_vector)); % 
plot(x_vector(3:end-2), cos_res{1,3}); % 1st deriv, actual
plot(x_vector(3:end-2), cos_res{1,4}); % 1st derivative, forward v2
plot(x_vector(3:end-2), cos_res{1,8}); % 1st deriv, backward v2
plot(x_vector(3:end-2), cos_res{1,12}); % 1st deriv, center v2
title('Forward/Backward/Center Methods, 1st Derivative - v2, cosine');
legend('cos(x)', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, lin_h(x_vector)); % 
plot(x_vector(3:end-2), linear_res{1,3}); % 1st deriv, actual
plot(x_vector(3:end-2), linear_res{1,4}); % 1st derivative, forward v2
plot(x_vector(3:end-2), linear_res{1,8}); % 1st deriv, backward v2
plot(x_vector(3:end-2), linear_res{1,12}); % 1st deriv, center v2
title('Forward/Backward/Center Methods, 1st Derivative - v2, Linear');
legend('3*x', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, tan(x_vector)); % 
plot(x_vector(3:end-2), tangent_res{1,3}); % 1st deriv, actual
plot(x_vector(3:end-2), tangent_res{1,4}); % 1st derivative, forward v2
plot(x_vector(3:end-2), tangent_res{1,8}); % 1st deriv, backward v2
plot(x_vector(3:end-2), tangent_res{1,12}); % 1st deriv, center v2
title('Forward/Backward/Center Methods, 1st Derivative - v2, Tangent');
legend('tan(x)', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, step_h(x_vector)); % 
plot(x_vector(3:end-2), step_res{1,3}); % 1st deriv, actual
plot(x_vector(3:end-2), step_res{1,4}); % 1st derivative, forward v2
plot(x_vector(3:end-2), step_res{1,8}); % 1st deriv, backward v2
plot(x_vector(3:end-2), step_res{1,12}); % 1st deriv, center v2
title('Forward/Backward/Center Methods, 1st Derivative - v2, Step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
%% Forward/Backward/Center, 2nd Derivative, v1
figure; 
hold on;
plot(x_vector, poly_h(x_vector)); % plot the polynomial
plot(x_vector(3:end-2), poly_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), poly_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(3:end-2), poly_res{2,6}); % 2nd deriv, backward v1
plot(x_vector(3:end-2), poly_res{2,10}); % 2nd deriv, center v1
title('Forward/Backward/Center Methods, 2nd Derivative - v1, Polynomial');
legend('Polynomial', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, cos(x_vector)); % plot the cosine
plot(x_vector(3:end-2), cos_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), cos_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(3:end-2), cos_res{2,6}); % 2nd deriv, backward v1
plot(x_vector(3:end-2), cos_res{2,10}); % 2nd deriv, center v1
title('Forward/Backward/Center Methods, 2nd Derivative - v1, Cosine');
legend('cos(x)', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, lin_h(x_vector)); % 
plot(x_vector(3:end-2), linear_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), linear_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(3:end-2), linear_res{2,6}); % 2nd deriv, backward v1
plot(x_vector(3:end-2), linear_res{2,10}); % 2nd deriv, center v1
title('Forward/Backward/Center Methods, 2nd Derivative - v1, Linear');
legend('3*x', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, tan(x_vector)); % 
plot(x_vector(3:end-2), tangent_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), tangent_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(3:end-2), tangent_res{2,6}); % 2nd deriv, backward v1
plot(x_vector(3:end-2), tangent_res{2,10}); % 2nd deriv, center v1
title('Forward/Backward/Center Methods, 2nd Derivative - v1, Tangent');
legend('tan(x)', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');

figure;
hold on;
plot(x_vector, step_h(x_vector)); % 
plot(x_vector(3:end-2), step_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), step_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(3:end-2), step_res{2,6}); % 2nd deriv, backward v1
plot(x_vector(3:end-2), step_res{2,10}); % 2nd deriv, center v1
title('Forward/Backward/Center Methods, 2nd Derivative - v1, Step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'Forward - v1', ...
       'Backward - v1', 'Center - v1');
   
%% Forward/Backward/Center, 2nd Derivative, v2
   
figure;
hold on;
plot(x_vector, poly_h(x_vector)); % 
plot(x_vector(4:end-3), poly_res{2,3}); % 2nd deriv, actual
plot(x_vector(4:end-3), poly_res{2,4}); % 2nd derivative, forward v2
plot(x_vector(4:end-3), poly_res{2,8}); % 2nd deriv, backward v2
plot(x_vector(4:end-3), poly_res{2,12}); % 2nd deriv, center v2
title('Forward/Backward/Center Methods, 2nd Derivative - v2, Polynomial');
legend('Poly', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, cos(x_vector)); 
plot(x_vector(4:end-3), cos_res{2,3}); % 2nd deriv, actual
plot(x_vector(4:end-3), cos_res{2,4}); % 2nd derivative, forward v2
plot(x_vector(4:end-3), cos_res{2,8}); % 2nd deriv, backward v2
plot(x_vector(4:end-3), cos_res{2,12}); % 2nd deriv, center v2
title('Forward/Backward/Center Methods, 2nd Derivative - v2, cosine');
legend('cos(x)', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, lin_h(x_vector)); % 
plot(x_vector(4:end-3), linear_res{2,3}); % 2nd deriv, actual
plot(x_vector(4:end-3), linear_res{2,4}); % 2nd derivative, forward v2
plot(x_vector(4:end-3), linear_res{2,8}); % 2nd deriv, backward v2
plot(x_vector(4:end-3), linear_res{2,12}); % 2nd deriv, center v2
title('Forward/Backward/Center Methods, 2nd Derivative - v2, Linear');
legend('3*x', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, tan(x_vector)); % 
plot(x_vector(4:end-3), tangent_res{2,3}); % 2nd deriv, actual
plot(x_vector(4:end-3), tangent_res{2,4}); % 2nd derivative, forward v2
plot(x_vector(4:end-3), tangent_res{2,8}); % 2nd deriv, backward v2
plot(x_vector(4:end-3), tangent_res{2,12}); % 2nd deriv, center v2
title('Forward/Backward/Center Methods, 2nd Derivative - v2, Tangent');
legend('tan(x)', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
figure;
hold on;
plot(x_vector, step_h(x_vector)); % 
plot(x_vector(4:end-3), step_res{2,3}); % 1st deriv, actual
plot(x_vector(4:end-3), step_res{2,4}); % 1st derivative, forward v2
plot(x_vector(4:end-3), step_res{2,8}); % 1st deriv, backward v2
plot(x_vector(4:end-3), step_res{2,12}); % 1st deriv, center v2
title('Forward/Backward/Center Methods, 2nd Derivative - v2, Step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'Forward - v2', ...
       'Backward - v2', 'Center - v2');
   
%% Forward - 1st Derivative, v1 vs v2
figure;
hold on;
plot(x_vector, poly_h(x_vector));
plot(x_vector(2:end-1), poly_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), poly_res{1,2}); % 1st derivative, forward v1
plot(x_vector(3:end-2), poly_res{1,4}); % 1st deriv, forward v2
title('Forward Method, 1st Derivative, v1 vs v2, Polynomial');
legend('Polynomial', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, cos(x_vector));
plot(x_vector(2:end-1), cos_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), cos_res{1,2}); % 1st derivative, forward v1
plot(x_vector(3:end-2), cos_res{1,4}); % 1st deriv, forward v2
title('Forward Method, 1st Derivative, v1 vs v2, cosine');
legend('cos(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, lin_h(x_vector));
plot(x_vector(2:end-1), linear_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), linear_res{1,2}); % 1st derivative, forward v1
plot(x_vector(3:end-2), linear_res{1,4}); % 1st deriv, forward v2
title('Forward Method, 1st Derivative, v1 vs v2, linear');
legend('3*x', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, tan(x_vector));
plot(x_vector(2:end-1), tangent_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), tangent_res{1,2}); % 1st derivative, forward v1
plot(x_vector(3:end-2), tangent_res{1,4}); % 1st deriv, forward v2
title('Forward Method, 1st Derivative, v1 vs v2, tangent');
legend('tan(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, step_h(x_vector));
plot(x_vector(2:end-1), step_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), step_res{1,2}); % 1st derivative, forward v1
plot(x_vector(3:end-2), step_res{1,4}); % 1st deriv, forward v2
title('Forward Method, 1st Derivative, v1 vs v2, step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'v1', 'v2');

%% Backward - 1st Derivative, v1 vs v2

figure;
hold on;
plot(x_vector, poly_h(x_vector));
plot(x_vector(2:end-1), poly_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), poly_res{1,6}); % 1st derivative, backward v1
plot(x_vector(3:end-2), poly_res{1,8}); % 1st deriv, backward v2
title('Backward Method, 1st Derivative, v1 vs v2, Polynomial');
legend('Polynomial', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, cos(x_vector));
plot(x_vector(2:end-1), cos_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), cos_res{1,6}); % 1st derivative, backward v1
plot(x_vector(3:end-2), cos_res{1,8}); % 1st deriv, backward v1
title('Backward Method, 1st Derivative, v1 vs v2, cosine');
legend('cos(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, lin_h(x_vector));
plot(x_vector(2:end-1), linear_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), linear_res{1,6}); % 1st derivative, backward v1
plot(x_vector(3:end-2), linear_res{1,8}); % 1st deriv, backward v2
title('Backward Method, 1st Derivative, v1 vs v2, linear');
legend('3*x', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, tan(x_vector));
plot(x_vector(2:end-1), tangent_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), tangent_res{1,6}); % 1st derivative, backward v1
plot(x_vector(3:end-2), tangent_res{1,8}); % 1st deriv, backward v2
title('Backward Method, 1st Derivative, v1 vs v2, tangent');
legend('tan(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, step_h(x_vector));
plot(x_vector(2:end-1), step_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), step_res{1,6}); % 1st derivative, backward v1
plot(x_vector(3:end-2), step_res{1,8}); % 1st deriv, backward v2
title('Backward Method, 1st Derivative, v1 vs v2, step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'v1', 'v2');

%% Center - 1st Derivative, v1 vs v2

figure;
hold on;
plot(x_vector, poly_h(x_vector));
plot(x_vector(2:end-1), poly_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), poly_res{1,10}); % 1st derivative, center v1
plot(x_vector(3:end-2), poly_res{1,12}); % 1st deriv, center v2
title('Center Method, 1st Derivative, v1 vs v2, Polynomial');
legend('Polynomial', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, cos(x_vector));
plot(x_vector(2:end-1), cos_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), cos_res{1,10}); % 1st derivative, center v1
plot(x_vector(3:end-2), cos_res{1,12}); % 1st deriv, center v2
title('Center Method, 1st Derivative, v1 vs v2, cosine');
legend('cos(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, lin_h(x_vector));
plot(x_vector(2:end-1), linear_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), linear_res{1,10}); % 1st derivative, center v1
plot(x_vector(3:end-2), linear_res{1,12}); % 1st deriv, center v2
title('Center Method, 1st Derivative, v1 vs v2, linear');
legend('3*x', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, tan(x_vector));
plot(x_vector(2:end-1), tangent_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), tangent_res{1,10}); % 1st derivative, center v1
plot(x_vector(3:end-2), tangent_res{1,12}); % 1st deriv, center v2
title('Center Method, 1st Derivative, v1 vs v2, tangent');
legend('tan(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, step_h(x_vector));
plot(x_vector(2:end-1), step_res{1,1}); % 1st deriv, actual
plot(x_vector(2:end-1), step_res{1,10}); % 1st derivative, center v1
plot(x_vector(3:end-2), step_res{1,12}); % 1st deriv, center v2
title('Center Method, 1st Derivative, v1 vs v2, step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'v1', 'v2');

%% Forward - 2nd Derivative, v1 vs v2
figure;
hold on;
plot(x_vector, poly_h(x_vector));
plot(x_vector(3:end-2), poly_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), poly_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(4:end-3), poly_res{2,4}); % 2nd deriv, forward v2
title('Forward Method, 2nd Derivative, v1 vs v2, Polynomial');
legend('Polynomial', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, cos(x_vector));
plot(x_vector(3:end-2), cos_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), cos_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(4:end-3), cos_res{2,4}); % 2nd deriv, forward v2
title('Forward Method, 2nd Derivative, v1 vs v2, cosine');
legend('cos(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, lin_h(x_vector));
plot(x_vector(3:end-2), linear_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), linear_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(4:end-3), linear_res{2,4}); % 2nd deriv, forward v2
title('Forward Method, 2nd Derivative, v1 vs v2, linear');
legend('3*x', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, tan(x_vector));
plot(x_vector(3:end-2), tangent_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), tangent_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(4:end-3), tangent_res{2,4}); % 2nd deriv, forward v2
title('Forward Method, 2nd Derivative, v1 vs v2, tangent');
legend('tan(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, step_h(x_vector));
plot(x_vector(3:end-2), step_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), step_res{2,2}); % 2nd derivative, forward v1
plot(x_vector(4:end-3), step_res{2,4}); % 2nd deriv, forward v2
title('Forward Method, 2nd Derivative, v1 vs v2, step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'v1', 'v2');

%% Backward - 2nd Derivative, v1 vs v2

figure;
hold on;
plot(x_vector, poly_h(x_vector));
plot(x_vector(3:end-2), poly_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), poly_res{2,6}); % 2nd derivative, backward v1
plot(x_vector(4:end-3), poly_res{2,8}); % 2nd deriv, backward v2
title('Backward Method, 2nd Derivative, v1 vs v2, Polynomial');
legend('Polynomial', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, cos(x_vector));
plot(x_vector(3:end-2), cos_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), cos_res{2,6}); % 2nd derivative, backward v1
plot(x_vector(4:end-3), cos_res{2,8}); % 2nd deriv, backward v2
title('Backward Method, 2nd Derivative, v1 vs v2, cosine');
legend('cos(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, lin_h(x_vector));
plot(x_vector(3:end-2), linear_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), linear_res{2,6}); % 2nd derivative, backward v1
plot(x_vector(4:end-3), linear_res{2,8}); % 2nd deriv, backward v2
title('Backward Method, 2nd Derivative, v1 vs v2, linear');
legend('3*x', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, tan(x_vector));
plot(x_vector(3:end-2), tangent_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), tangent_res{2,6}); % 2nd derivative, backward v1
plot(x_vector(4:end-3), tangent_res{2,8}); % 2nd deriv, backward v2
title('Backward Method, 2nd Derivative, v1 vs v2, tangent');
legend('tan(x)', 'Analytic', 'v1', 'v2');

figure;
hold on;
plot(x_vector, step_h(x_vector));
plot(x_vector(3:end-2), step_res{2,1}); % 2nd deriv, actual
plot(x_vector(3:end-2), step_res{2,6}); % 2nd derivative, backward v1
plot(x_vector(4:end-3), step_res{2,8}); % 2nd deriv, backward v2
title('Backward Method, 2nd Derivative, v1 vs v2, step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'v1', 'v2');

%% Center - 2nd Derivative, v1 vs v2

figure;
hold on;
plot(x_vector, poly_h(x_vector));
plot(x_vector(3:end-2), poly_res{2,9}); % 2nd deriv, actual
plot(x_vector(3:end-2), poly_res{2,10}); % 2nd derivative, center v1
plot(x_vector(4:end-3), poly_res{2,12}); % 2nd deriv, center v2
title('Center Method, 2nd Derivative, v1 vs v2, Polynomial');
legend('Polynomial', 'Analytic', 'v1', 'v2');
snapnow;

figure;
hold on;
plot(x_vector, cos(x_vector));
plot(x_vector(3:end-2), cos_res{2,9}); % 2nd deriv, actual
plot(x_vector(3:end-2), cos_res{2,10}); % 2nd derivative, center v1
plot(x_vector(4:end-3), cos_res{2,12}); % 2nd deriv, center v2
title('Center Method, 2nd Derivative, v1 vs v2, cosine');
legend('cos(x)', 'Analytic', 'v1', 'v2');
snapnow;

figure;
hold on;
plot(x_vector, lin_h(x_vector));
plot(x_vector(3:end-2), linear_res{2,9}); % 2nd deriv, actual
plot(x_vector(3:end-2), linear_res{2,10}); % 2nd derivative, center v1
plot(x_vector(4:end-3), linear_res{2,12}); % 2nd deriv, center v2
title('Center Method, 2nd Derivative, v1 vs v2, linear');
legend('3*x', 'Analytic', 'v1', 'v2');
snapnow;

figure;
hold on;
plot(x_vector, tan(x_vector));
plot(x_vector(3:end-2), tangent_res{2,9}); % 2nd deriv, actual
plot(x_vector(3:end-2), tangent_res{2,10}); % 2nd derivative, center v1
plot(x_vector(4:end-3), tangent_res{2,12}); % 2nd deriv, center v2
title('Center Method, 2nd Derivative, v1 vs v2, tangent');
legend('tan(x)', 'Analytic', 'v1', 'v2');
snapnow;

figure;
hold on;
plot(x_vector, step_h(x_vector));
plot(x_vector(3:end-2), step_res{2,9}); % 2nd deriv, actual
plot(x_vector(3:end-2), step_res{2,10}); % 2nd derivative, center v1
plot(x_vector(4:end-3), step_res{2,12}); % 2nd deriv, center v2
title('Center Method, 2nd Derivative, v1 vs v2, step');
legend('heaviside(x-3)*sin(2x)', 'Analytic', 'v1', 'v2');
snapnow;