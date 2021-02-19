 function [area,error] = trapezoidal_with_error(f,f_double_prime,xmin,xmax,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    % f - primary function
    % f_double_prime - 2nd derivative of f
    % xmin <= xmax
    % n > 1 - number of segments
    
    % area  - for each segment
    % error - for each segment
    
    xdelta = (xmax - xmin) ./ n;
    index = 1;
    area  = 0;
    error = 0;
    
    for xcurrent = [xmin : xdelta : (xmax - xdelta)]
        area = area + ((f(xcurrent) + f(xcurrent + xdelta)) ./ 2) .* xdelta;
        index = index + 1;
        % error = error + ??;
        h = (((xcurrent+xdelta) - xcurrent) / n);
        %error = error + (-1/12)*(h^3)*f_double_prime(xcurrent + xdelta/2);
    end
 end