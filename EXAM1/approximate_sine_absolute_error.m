function [value, n, error] = approximate_sine_absolute_error(x, n_max, error_threshold, approximation_method, word_length, fraction_length)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

value = [];
n = [];
error = [];

for x_index = 1 : 1 : length(x)
    n_current = 1;
    found = false;
    x_val = x(x_index);
    
    while((found == false) && (n_current <= n_max))
        
        if isequal(approximation_method, @approximate_sine_fixed) % using fixed precision
            [value_current, error_current] = approximation_method(x_val, n_current, word_length, fraction_length); 
        else % double or single
            [value_current, error_current] = approximation_method(x_val, n_current);
        end
        
        if (abs(error_current) <= error_threshold)
            found = true;
            value(x_index) = value_current;
            error(x_index) = error_current;
            n(x_index) = n_current;
        else
            n_current = n_current + 1;
        end
        
    end
end
end