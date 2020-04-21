function [x_approx, x_ideal, y_actual, n] = ...
    Bisection_by_symbolic(y_sym, symvar, xmin, xmax, threshold, n_max )
% BISECTION_BY_SYMBOLIC: Provide symbolic function to determine root
% INPUT ARGS:
%   y_sym       : symbolic function
%   symvar      : symbolic var of the root
%   xmin        : lower bound of search
%   xmax        : upper bound of search
%   threshold   : threshold of error compared to solution of vpasolve, in %
%   n           : max iterations
%
% OUTPUT ARGS:
%   x_approx    : root found by Bisection_by_symbolic
%   x_ideal     : root found by vpasolve
%   y_actual    : value of eval(subs(y_sym, x, x_approx))
%   n           : number of iterations taken

% summary
% all in loop with error threshold
% start with xmin and xmax
% determine xmid
% calc f(xmin) * f(xmid)
% if ^ < 0 (change in sign)
    % have root b/t xmin and xmid
    % xmin = xmin;
    % xmax = xmid;so there is root b/t
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
    
    x_ideal = double(vpasolve(y_sym == 0, symvar, [xmin xmax]));
    
    done = false;
    while done == false
        n = n + 1;
        xmid = (xmin + xmax) / 2;
        
        if ((y_h(xmin) * y_h(xmid)) < 0) % change in sign, root between
            xmin = xmin;
            xmax = xmid;
        else % root b/t mid and max
            xmin = xmid;
            xmax = xmax;
        end
        
        e_t = abs((x_ideal - xmid) / x_ideal) * 100; % percent
        
        if ((e_t < threshold) | (n == n_max))
            done = true;
        end
    end
    
    x_approx = xmid;
    y_actual = y_h(x_approx);
    
end

% test with problem 5.8
% 5.8: Locate the first nontrivial root of sin(x) = x^2 where x is
% in radians. Use a graphical technique and bisection with the
% initial interval from 0.5 to 1. Perform the computation until
% e_a is less than ? s = 2%