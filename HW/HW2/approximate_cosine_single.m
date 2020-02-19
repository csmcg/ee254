function [value, error] = approximate_cosine_single(x, desired_error)
% The Maclaurin series expansion for the cosine is:
%   cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + x^8/8!  - ... 

    x = single(x);
    maclaurin = 2;
    value = single(1);
    count = 2;
    true_val = single(cos(x));
    error = single(1); % abs(value - true_val) ./ true_val;
    desired_error = single(desired_error);

    while error >= desired_error
        if mod(count,2) == 0 % if even index
            value = value - ((x.^(maclaurin)) ./ factorial(maclaurin));
        else
            value = value + ((x.^maclaurin) ./ factorial(maclaurin));
        end
        
        count = count + 1;
        maclaurin = maclaurin + 2;
        error = single(abs((value - true_val) ./ true_val));
    end
end