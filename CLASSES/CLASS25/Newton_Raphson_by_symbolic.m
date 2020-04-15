function [x_approx, x_ideal, y_actual, n] = Newton_Raphson_by_symbolic(y_sym, x_init, threshold, n_max)


    syms x;
    y_h = matlabFunction(y_sym);
    y_prime_sym = diff(y_sym);
    y_prime_h = matlabFunction(y_prime_sym);

    % look at our true error as the stopping criteria for threshold
    e_t = 2*threshold;
    n = 0;
    x_i = x_init;
    
    x_root_vpa = vpasolve(y_sym == 0, x, x_init); % use x_init to seed, which is our x_i, i=0
    
    while ((e_t > threshold) && (n <= n_max))
        % use current val of x (x_i) to calculate the next, x_i+1
        % x_next -> x_i+1
        % x_current -> x_i
        % x_prev -> x_i-1
        
        x_next = x_i - ((y_h(x_i) / y_prime_h(x_i)));
        %e_t = abs((x_root_vpa - x_next) / x_root_vpa); % decimal
        e_t = abs(x_root_vpa - x_next);
        
        x_i = x_next;
        n = n + 1;
        
    end
    
    x_approx = x_i;
    x_ideal = x_root_vpa;
    y_actual = y_h(x_approx);
    
end