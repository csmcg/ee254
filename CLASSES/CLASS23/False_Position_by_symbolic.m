function [x_approx, error, x_ideal, y_actual, n] = ...
    False_Position_by_symbolic(y_sym, symvar, xmin, xmax, threshold, n_max)



    n = 0; % iteration counter
    e_t = threshold * 2; % init error
    
    % create handle for function
    y_h = matlabFunction(y_sym);
    
    % find ideal root solution
    x_ideal = double(vpasolve(y_sym == 0, symvar, [xmin xmax]));
    if length(x_ideal > 1)
        x_ideal = x_ideal(1);
    end
    
    done = false;
    while done == false
        % join f(xl) and f(xu) w/ straight line
        % the intersection of this line w/ x-axis is the improved estimate
        % Formula for that intersection:
        % x_r = x_u - f(x_u)*(x_l - x_u)
        %             -------------------
        %              f(x_l) - f(x_u)
        n = n + 1;
        
        x_approx = xmax - (y_h(xmax)*(xmin - xmax)) / (y_h(xmin)-y_h(xmax));
        
        test = sign(y_h(x_approx));
        
        if (sign(y_h(xmax)) == test)
            xmax = x_approx;
        else
            xmin = x_approx;
        end        
        
        e_t = abs(x_ideal - x_approx);
        
        if ((e_t < threshold) | (n == n_max))
            done = true;
        end
    end
    y_actual = y_h(x_approx);
    error = e_t;
end
               
               