function [x_approx, x_ideal, y_actual, n] = Bisection_by_symbolic(y_sym, x_min, x_max, threshold, n_max )
% summary
% all in loop with error threshold
% start with xmin and xmax
% determine xmid
% calc f(xmin) * f(xmid)
% if ^ < 0 (change in sign)
    % have root b/t xmin and xmid
    % xmin = xmin;
    % xmax = xmid;
    % recalc xmid
% else (no change in sign) 
    % root b/t xmid and xmax, so:
    % xmin = xmid
    % xmax = xmax
    % recalc xmid
% end
    % go back to calc f(xmin) * f(xmid)

    
% e_t = true error between x_approx and x_ideal
% return:
    % x_approx: our approx root
    % x_ideal: matlab's root
    % y_actual: value at x_approx (y(x_approx))
    % n: num iterations
    
    % check thresh > 0
    % check y_sym exists and is symbolic
    % check n_max > 1
    % check xmin < xmax
    
    
    n = 0; % number iterations
    e_t = threshold * 2;
    
    % threshold is decimal value of the e_t
    syms x;
    y_h = matlabFunction(y_sym);
    
    while ((e_t > threshold) || (n < n_max))
        n = n + 1;
        xmid = (xmin + xmax) / 2;
        
        if ((y_h(xmin) * y_h(xmid)) < 0)

        elseif
            
        end
        
        if (n < n_max)
            % stopped via threshold
            % use vpasolve to find the root and compare to 
        else
            % 
        end
        
    end
    
    
end

% test with problem 5.8
% 5.8: Locate the first nontrivial root of sin(x) = x^2 where x is
% in radians. Use a graphical technique and bisection with the
% initial interval from 0.5 to 1. Perform the computation until
% e_a is less than ? s = 2%

