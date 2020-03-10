%approx integration of sin(x), error thresh = 0.001, 0 to 2pi, show n 
% for all the different methods 
% something with fixed?

% sin(x) and cos(x), other functions too
% use the methods: left hand rect, right hand rect, midpoint, and the
% others from table 19.2

% table:
% function | method | n | error | xmin | xmax | area

threshold = 0.001;
x_min = 0;
x_delta = pi/16;
x_max = 2*pi;
x = [x_min : x_delta : x_max];

%% define functions
sine_func = @(x) sin(x);
sine_2p = @(x) -sin(x);
sine_4p = @(x) sin(x);
sine_6p = @(x) -sin(x);

poly_func = @(x) ((x-4)^2 + 5);
poly_2p = @(x) 10*x^3 - 12*x^2 + 6*x - 10;
poly_4p = @(x) 60*x - 24;
poly_6p = @(x) 0;


n_current = 0;
area_delta = threshold * 2;
area_previous = 0;
area_n = [];
error_n = [];

while (area_delta > threshold)
    n_current = n_current + 1;
    [area_n(n_current), error(n_current)] = trapezoidal_with_error(sine_func, sine_2p, x_min, x_max, n_current);
    %[area_n(n_current), error(n_current)] = simpsons_one_third(sine_func, sine_4p, x_min, x_max, n_current);
    area_delta = area_n(n_current) - area_previous;
    area_previous = area_n(n_current);
end
