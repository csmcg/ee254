%% EE254 P5 - Romberg Integration, Connor McGarty, cmcgarty
% 
% In this project, we examine the error of different levels of Romberg 
% Integration. For different functions, the different levels of R.I. and
% the decrease of the error as the number of integration segment increases.
% With the higher order of Romberg Integration, the error decreases much
% more quickly as number of segments increase as well.

%% Solution
close all; clear; clc;
syms x;
%%% Define Functions
y1 = 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
y2 = x + (1/(x+1));
y3 = -0.055*x^4 + 0.86*x^3 - 4.2*x^2 + 6.3*x + 2;
y4 = 5*cos(x-(pi/2));


% for each function
    % increase n 
    % for each xdelta, do romberg up to 3 levels
for i = [1:4]
    
    switch i
        case 1
            f = y1;
            t = '0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5';
        case 2
            f = y2;
            t = 'x + (1/x)';
        case 3
            f = y3;
            t = '-0.055*x^4 + 0.86*x^3 - 4.2*x^2 + 6.3*x + 2';
        case 4
            f = y4;
            t = '5*cos(x-(pi/2))';
    end    
    
    xmin = 0;
    xmax = 2;
    stop = 5;
    for n = [0:stop]
        [area(n+1), error(n+1)] = ...
            trapezoidal_with_error(matlabFunction(f), matlabFunction(diff(f)), ...
            xmin, xmax, 2^n);
    end
    
    figure;
    area_actual = integral(matlabFunction(f), xmin, xmax);
    e_t = abs(area - area_actual);    
    subplot(2,2,1);
    sgtitle(strcat('Trapezoidal Romberg Iteration:', ' ', t));
    plot(1:length(e_t), e_t);
    title('Num Segments vs Error, O(h^2)');
    
    subplot(2,2,2);
    
    order_2 = (4/3)*area(2:end) - (1/3)*area(1:end-1);
    e_t_order2 = abs(order_2 - area_actual);
    plot(1:length(order_2), e_t_order2);
    title('Romberg Iteration Error, O(h^4)');
    subplot(2,2,3);
    
    order_3 = (16/15)*order_2(2:end) - (1/15)*order_2(1:end-1);
    e_t_order3 = abs(order_3 - area_actual);
    plot(1:length(order_3), e_t_order3);
    title('Romberg Iteration Error, O(h^6)');
    subplot(2,2,4);
    
    order_4 = (64/63)*order_3(2:end) - (1/63)*order_3(1:end-1);
    e_t_order4 = abs(order_4 - area_actual);
    plot(1:length(order_4), e_t_order4);
    title('Romberg Iteration Error, O(h^8)');

end