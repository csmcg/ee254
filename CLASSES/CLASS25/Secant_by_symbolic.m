function [x_approx, x_ideal, y_actual, n] = Secant_by_symbolic(y_sym, x_init, x_prev, threshold, n_max)
%SECANT_BY_SYMBOLIC Summary of this function goes here

    syms x;
    y_h = matlabFunction(y_sym);
    
    x_root_vpa = vpasolve(y_sym == 0, x, x_init);
    
    e_t = 2*threshold;
    n = 0;
    x_i = x_init;
    % x_prev as input arg

    while ((e_t > threshold) && (n <= n_max))
        
        x_next = x_i - ((y_h(x_i)*(x_prev - x_i)) / (y_h(x_prev)-y_h(x_i));

        e_t = abs(x_root_vpa - x_next);
        n = n + 1;
        x_prev = x_i;
        x_i = x_next;
        
    end
    
    x_ideal = x_root_vpa;
    x_approx = x_i;
    y_actual = y_handle(x_approx);
end

