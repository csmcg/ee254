function [value, error] = approximate_cosine_fixed(x, desired_error, word_length, fraction_length)
% The Maclaurin series expansion for the cosine is:
%   cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + x^8/8!  - ... 

    x = fi(x, 1, 8, 4);
    maclaurin = 2;
    value = fi(1, 1, 8, 4);
    count = 2;
    true_val = fi(cos(x), 1, 8, 4);
    error = fi(1, 1, 8, 4); % abs(value - true_val) ./ true_val;
    desired_error = fi(desired_error, 1, 8, 4);

    while (error >= desired_error)
        if mod(count,2) == 0 % if even index
            value = value - ((x.^(maclaurin)) ./ factorial(maclaurin));
        else
            value = value + ((x.^maclaurin) ./ factorial(maclaurin));
        end
        
        count = count + 1;
        maclaurin = maclaurin + 2;
        error = fi(abs((value - true_val) ./ true_val), 1, 8, 4);
        if true_val == value
            break
        end
    end
end