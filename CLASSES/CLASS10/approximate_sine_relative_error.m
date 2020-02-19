function [value ,error, n] = approximate_sine_relative_error(x, error_max )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    value = [];
    error = [];
    n = [];

    n_max = 100;
    n_current = 1;
    found = false;

    for x_index = 1 : 1 : length( x )
        disp(sprintf('Evaluating: %f', x( x_index ) ) );
        
        n_current = 1;
        found = false;

        value( x_index ) = NaN;
        error( x_index ) = NaN;
        n( x_index ) = n_current;        
        
        value_previous = fi(0, 1, 16, 12);
        value_delta = 2 * error_max;        
        
        while ((abs(value_delta) >= error_max) || (n_current == 1)) && (n_current <= n_max )
            value_current = 0;
            
            for n_index = [ 1 : 1 : n_current ]
                value_current = value_current + (((-1)^(n_index + 1)) * ( x(x_index)^(2*n_index - 1)) ./ factorial( 2*n_index - 1));
            end

            value_delta = value_previous - value_current;
            value_previous = value_current;
            n_current = n_current + 1;
        end
        
        value( x_index ) = value_current;
        error( x_index ) = value_delta;        
        n( x_index ) = n_current;
    end
end

