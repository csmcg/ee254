function [ value, error ] = approximate_sine( x, n )
%approximate_sine uses series to estimate sine(theta)
%   x - vector of doubles ( 1 x m )
%   n - number of terms in the series
%   value - f(x) ( 1 x m )
%   error - difference between series and sin(x) ( 1 x m )

    value = fi(0, 1, 16, 14);
    y = sin( x );
    
    % consider checking the size and the datatype of x
    if (n >= 1) 
        for n_current = [ 1 : 1 : n ]
            value = value + (((-1)^(n_current + 1)) * ( x.^(2*n_current - 1)) ./ factorial( 2*n_current - 1));
        end        
    else 
        disp('Error: please enter a positive n!');
    end

    error = fi(value - y, 1, 16, 14); % approx - actual
end

