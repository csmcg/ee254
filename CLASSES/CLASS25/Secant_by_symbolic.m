function [x_approx, error, x_ideal, y_actual, n] = Secant_by_symbolic(y_sym, x_init, delta, threshold, n_max)
%SECANT_BY_SYMBOLIC Summary of this function goes here

    syms x;
    y_h = matlabFunction(y_sym);
    
    x_ideal = double(vpasolve(y_sym == 0, x, [0 2]));
    if (length(x_ideal) > 1)
        x_ideal = x_ideal(1);
    end
    
    e_t = 2*threshold;
    n = 0;
    x_i = x_init;
    % x_prev as input arg
    done = false;
    while (done == false)
        n = n + 1;
        
        x_ip1 = x_i - ((delta*x_i*y_h(x_i)) / (y_h(x_i + delta*x_i) - y_h(x_i)));

        e_t = abs(x_ideal - x_ip1);
        
        if((e_t < threshold) | (n == n_max))
            done = true;
        end
        
        x_i = x_ip1;
    end
    error = e_t;
    x_approx = x_ip1;
    y_actual = y_h(x_approx);
end

