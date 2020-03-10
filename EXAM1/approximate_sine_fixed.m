function [ value, error ] = approximate_sine_fixed( x, n, word_length, fraction_length)
%approximate_sine uses series to estimate sine(theta), fixed precision
%   x - vector of doubles ( 1 x m )
%   n - number of terms in the series
%   value - f(x) ( 1 x m )
%   error - difference between series and sin(x) ( 1 x m )

    value = fi(0, 1, word_length, fraction_length);
    y = sin( x );
    x = fi(x, 1, word_length, fraction_length);
    
    % consider checking the size and the datatype of x
    if (n >= 1) 
        for n_current = [ 1 : 1 : n ]
         previous_val = fi(value, 1, word_length, fraction_length);
         value = fi(previous_val + (((-1)^(n_current + 1)) * ( x.^(2*n_current - 1)) ./ factorial( 2*n_current - 1)), 1, word_length, fraction_length);

        end        
    else 
        disp('Error: please enter a positive n!');
    end

    error = y - value;
end