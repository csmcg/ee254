function [x_approx, error, x_ideal, y_actual, n] = ...
    Fixed_point_by_symbolic(y_sym, symvar, threshold, n_max)

    % change f(x) = 0 into x = g(x)
    % we will solve for the left hand x, such that
    % x_i+1 = g(x_i)
    
    %syms symvar;
    g = y_sym + symvar;
    y_h = matlabFunction(y_sym);
    g_h = matlabFunction(g);
    e_t = threshold * 2;
    
    n = 0;
    done = false;
    
    x_i = 2*rand(1); % guess
    x_ideal = double(vpasolve(y_sym == 0, symvar, [0 2]));
    if (length(x_ideal > 1))
        x_ideal = x_ideal(1);
    end
    while done == false
        n = n + 1;
        
        x_ip1 = g_h(x_i);
        
        e_t = abs(x_ideal - x_ip1);
        
        if ((e_t < threshold) | (n == n_max))
            done = true;
        else
            x_i = x_ip1;
        end
    end        
    error = e_t;
    x_approx = x_ip1;
    y_actual = y_h(x_approx);
end