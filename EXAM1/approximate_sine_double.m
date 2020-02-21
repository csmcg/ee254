function [ value, error ] = approximate_sine_double( x, n )
%approximate_sine uses series to estimate sine(theta)
%   x - vector of doubles ( 1 x m )
%   n - number of terms in the series
%   value - f(x) ( 1 x m )
%   error - difference between series and sin(x) ( 1 x m )

    value = 0;
    y = sin( x );
    
    % consider checking the size and the datatype of x
    if (n >= 1) 
        for n_current = [ 1 : 1 : n ]
            previous_val = value;
            value = previous_val + ...
                (((-1).^n_current) .* (x .^ (2*n_current + 1))) ...
                ./ factorial(2*n_current + 1);
        end        
    else 
        disp('Error: please enter a positive n!');
    end

    error = value - y; % approx - actual
end

