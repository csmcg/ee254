function [value ,error, n] = approximate_sine_actual_error(x, error_max )
%UNTITLED2 Summary of this function goes here
%   x - vector of doubles ( 1 x m )
%   n - number of terms in the series
%   value - f(x) ( 1 x m )
%   error - difference between series and sin(x) ( 1 x m )

    value = [];
    error = [];
    n = [];

    n_max = 1000;
    n_current = 1;
    found = false;

    for x_index = 1 : 1 : length( x )
        disp(sprintf('Evaluating: %f', x( x_index ) ) );
        
        n_current = 1;
        found = false;

        value( x_index ) = NaN;
        error( x_index ) = NaN;
        n( x_index ) = n_current;        
        
        while ((found == false) && (n_current <= n_max))                                    
            disp(sprintf('  Iteration: %d', n_current ) );
            [ value_current, error_current ] = approximate_sine( x( x_index ), n_current );
            if (max(abs(error_current)) <= error_max ) 
                found = true;                                
                value( x_index ) = value_current;
                error( x_index ) = error_current;
                n( x_index ) = n_current;
            else
                n_current=n_current+1;
            end
        end        
    end
end

