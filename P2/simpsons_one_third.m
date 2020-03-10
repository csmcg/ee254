 function [area,error] = simpsons_one_third(f,f_quad_prime,xmin,xmax,n)
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
    area = 0;
    error = 0;
    
    for xcurrent = [xmin : xdelta : (xmax - xdelta)]
        area = area + ((f(xcurrent) + 4*f(xcurrent + xdelta) + f(xcurrent + 2*xdelta)) ...
                       / 6) * xdelta;
        index = index + 1;
        % error = error + ??;
        h = (((xcurrent+xdelta) - xcurrent) / n);
        error = error + (-1/90)*(h^5)*f_quad_prime(xcurrent + xdelta/2);
    end
 end