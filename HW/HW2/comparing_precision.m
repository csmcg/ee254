x = linspace(0, 2*pi, 1000);
y_double = [];
err_double = [];
y_single = [];
err_single = [];
y_fixed = [];
err_fixed = [];


error_threshold = 1*(10.^-3);

for index = 1:length(x)
    [y_double(index), err_double] = ... 
        approximate_cosine_dbl(x(index), error_threshold);
    [y_single(index), err_single] = ... 
        approximate_cosine_single(x(index),error_threshold);
    [y_fixed(index), err_fixed] = ...
        approximate_cosine_fixed(x(index), error_threshold);
end

plot(x, y_double, 'r*', x, y_single, 'b+');