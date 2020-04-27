% modify incremental search from outline 22
% finish bisect_b_sym
% write False_Position_by_Symbolic
% need the open method as well (once we learn it)

% should already have:
    % incremental search
% CLOSED (bracketed):
    % bisection
    % false position
% OPEN:
    % fixed point
    % Newton Raphson
    % Secant (2-points)
    
syms x;
y = x^2 - 1;

[root_approx, root_ideal, y_actual, iter] = False_Position_by_symbolic...
    (y, x, 0, 2, .5, 50)



