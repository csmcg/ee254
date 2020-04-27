% Use Romberg integration to evaluate
%
% integral of (x+(1/x))^2 from x = 1 to x = 2
% to an accuracy of epsilon_s = 0.5%
% Results should be presented in foramt of Fig. 20.1
% Use analytical solutino of the integral to determine the percent relative
% error of the result obtained with Romberg integration. Check that
% epsilon_t is less than epsilon_s

syms x;
y = (x + (1/x))^2;

epsilon_s_target = 0.5; % in percent

analytical = 29 / 6; % handsolve


