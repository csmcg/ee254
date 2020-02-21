%% Problem{08}: Demonstration of datatype error/precision utilizing convergence.

%% Authorship
% * File: Problem_08.m
% * Copy: Copyright (c) 2020 Connor McGarty
% * BlazerID: cmcgarty
% * Vers: 1.0.0 02/18/2020 CSM
% * Desc: Driver for testing concepts in E1. 

%% Description
% Given x ranging from 0 to 2*pi at an interval of pi/16, demonstrate using
% Matlab a table (disp or sprintf) and a plot of n iterations as a function
% of x.  Include the results for double and single precision.
% Save your .m file and publish the .pdf to your drop folder on the L:
% Drive.

%% Results
% disp('datatype        x_min    x_max    max_error    n_min    n_max');
% disp('====================================================================');
% disp('double                                                              ');
% disp('single                                                              ');
% disp('fi(x,1,32,28)                                                       ');
% disp('fi(x,1,32,24)                                                       ');
% disp('fi(x,1,32,20)                                                       ');
% disp('fi(x,1,32,16)                                                       ');
% disp('fi(x,1,32,12)                                                       ');
% disp('fi(x,1,32,8)                                                        ');
% disp('fi(x,1,32,4)                                                        ');
% disp('====================================================================');

 %% Plot
% * x vs n for each datatype/combination
% * title
% * legend
% * axis labels 
% * all graphs in one plot.

%% Bonus
% Make a 3D plot of the following:
%
% x = [ x_min : x_delta : x_max ];
%
% fraction_length = [ fraction_length_ min : 1 : fraction_length_ max ];
% 
% n_max for a given x and fraction_length.

%% SOLUTION
clear;clc;
x_min = 0;
x_step = pi/16;
x_max = 2*pi;

x = [x_min : x_step : x_max];

threshold = 0.01;
n_max = 200;
word_length = 32;
fraction_length = 28; % will be decremented by 4 each succession later

value = [];
n = [];
error = [];

table = sprintf("\ndatatype\t\tx_min\tx_max\terror_max\tn_min\tn_max\n");
table = table + "=========================================================\n";

for index = [1:1:9]
    switch index
        case 1
            
            [value(index, :), n(index, :), error(index, :)] = ... 
                approximate_sine_absolute_error(x, n_max, threshold, @approximate_sine_double, [], []);
            
            table = table + sprintf("double\t\t%d\t%d\t%f\t%d\t%d\n", x_min, x_max, max(error(index, :)), min(n(index, :)), max(n(index, :)));
            
        case 2
            
            [value(index, :), n(index, :), error(index, :)] = ... 
                approximate_sine_absolute_error(x, n_max, threshold, @approximate_sine_single, [], []);
            
            table = table + sprintf("single\t\t%d\t%d\t%f\t%d\t%d\n", x_min, x_max, max(error(index,:)), min(n(index, :)), max(n(index, :)));
            
        otherwise
            
            [value(index, :), n(index, :), error(index, :)] = ...
                approximate_sine_absolute_error(x, n_max, threshold, @approximate_sine_fixed, word_length, fraction_length);
            
            table = table + sprintf("fi(x,1,%d,%d)\t\t%d\t%d\t%f\t%d\t%d\n", word_length, fraction_length, x_min, x_max, max(error(index,:)), min(n(index, :)), max(n(index, :))); 
            fraction_length = fraction_length - 4;
    end
end
disp(table);