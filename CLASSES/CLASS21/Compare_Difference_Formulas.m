function [Results] = Compare_Difference_Formulas(y_sym, xmin, xmax, xdelta)
% Compare the 2 formulas for both, 1st & 2nd derivatives, and compare
% against forware, backward, and center
% compare forward, backward and center for each
% 6 formulas for 1st deriv and 6 for 2nd

% DELIVERABLES:
% calculate the actual values of derivatives at these locations, find
% actual vs approximate for each formula

    % return array of cells: 
    Results = {};
    
    syms x;
    y_sym_prime = diff(y_sym);
    y_sym_double_prime = diff(y_sym_prime);
    
    y_h = matlabFunction(y_sym);
    x_v = [xmin : xdelta : xmax]; % won't be able to use entire domain
    
    
%% FORWARD FINITE DIFFERENCE FORMULAS
    % 1st DERIVATIVE v1
    % x, x + xdelta
    
    % SOLUTION
    % x: x_vector(2)
    % x + xdelta is x_vector(3)
    Results{1, 1} = eval(subs(y_sym_prime, x, x_v(2:end-1))); % symbolic derivative as "actual"
    Results{1, 2} = (y_h(x_v(3:end)) - y_h(x_v(2: end - 1))) / xdelta; 
        
    % 1st DERIVATIVE v2
    % x, x + xdelta, x + 2*xdelta
    Results{1, 3} = eval(subs(y_sym_prime, x, x_v(3:end-2)));% same as Results{1,1}, different x_vector
    Results{1, 4} = (-1*y_h(x_v(5:end)) + 4*y_h(x_v(4:end-1)) - 3*y_h(x_v(3:end-2))) ./ 2*xdelta;
    
    
    % 2nd DERIVATIVE v1
    % x, x + xdelta, x + 2*xdelta
    % x is x_vector(3)
    % x + xdelta is x_vector(4)
    % x + 2*xdelta is x_vector(5)
    % actual, Results {2, 1}
    Results{2, 1} = eval(subs(y_sym_double_prime, x, x_v(3: end - 2)));
    Results{2, 2} = (y_h(x_v(5:end)) - 2*y_h(x_v(4:end-1)) + y_h(x_v(3:end-2))) ...
        / (xdelta^2);
    
    % 2nd DERIVATIVE v2
    % possible xi vals => 4:end-3
    Results{2, 3} = eval(subs(y_sym_double_prime, x, x_v(4:end-3)));
    Results{2, 4} = (-1*y_h(x_v(7:end)) + 4*y_h(x_v(6:end-1)) - 5*y_h(x_v(5:end-2)) + 2*y_h(x_v(4:end-3))) / xdelta^2;
    
    
    %% BACKWARD FINITE DIFFERENCE FORMULAS
    % 1st DERIVATIVE v1
    % x, x - xdelta
    % x is x_vector(2)
    % x - xdelta is x_vector(1)
    % possible xi vals => 2:end-1
    Results{1, 5} = eval(subs(y_sym_prime, x, x_v(2:end-1)));
    Results{1, 6} = (y_h(x_v(2:end-1)) - y_h(x_v(1:end-2))) / xdelta;
    
    % 1st DERIVATIVE  v2
    % x, x - xdelta, x - 2*xdelta
    Results{1, 7} = eval(subs(y_sym_prime, x, x_v(3:end-2)));
    Results{1, 8} = (3*y_h(x_v(3:end-2)) - 4*y_h(x_v(2:end-3)) + y_h(x_v(1:end-4))) / 2*xdelta;
    
    % 2nd DERIVATIVE v1
    %  x, x - xdelta, x - 2*xdelta
    Results{2, 5} = eval(subs(y_sym_double_prime, x, x_v(3:end-2)));
    Results{2, 6} = (y_h(x_v(3:end-2)) - 2*y_h(x_v(2:end-3)) + y_h(x_v(1:end-4))) / xdelta^2;
    % 2nd DERIVATIVE v2
    Results{2, 7} = eval(subs(y_sym_double_prime, x, x_v(4:end-3)));
    Results{2, 8} = (2*y_h(x_v(4:end-3)) - 5*y_h(x_v(3:end-4)) + 4*y_h(x_v(2:end-5)) - y_h(x_v(1:end-6))) / xdelta^2;
    
    %% CENTERED FINITE DIFFERENCE FORMULAS
    % 1st DERIVATIVE v1
    % x - xdelta, x + xdelta
    Results{1, 9} = eval(subs(y_sym_prime, x, x_v(2:end-1)));
    Results{1, 10} = (y_h(x_v(3:end)) - y_h(x_v(1:end-2))) ./ 2.*xdelta;
    % 1st DERIVATIVE v2
    % x -2*xdelta, x - xdelta, x + xdelta, x + 2*xdelta
    Results{1, 11} = eval(subs(y_sym_prime, x, x_v(3:end-2)));
    Results{1, 12} = (-y_h(x_v(5:end)) + 8*y_h(x_v(4:end-1)) - 8*y_h(x_v(2:end-3)) + y_h(x_v(1:end-4))) / 12*xdelta;
    
    % 2nd DERIVATIVE v1
    % x, x + xdelta, x - xdelta, 
    Results{2, 9} = eval(subs(y_sym_double_prime, x, x_v(3:end-2)));
    Results{2, 10} = (y_h(x_v(4:end-1)) - 2*y_h(x_v(3:end-2)) + y_h(x_v(2:end-3))) / xdelta^2;
    % 2nd DERIVATIVE v2
    Results{2, 11} = eval(subs(y_sym_double_prime, x, x_v(4:end-3)));
    Results{2, 12} = (-y_h(x_v(6:end-1)) + 16*y_h(x_v(5:end-2)) - 30*y_h(x_v(4:end-3)) + 16*y_h(x_v(3:end-4)) - y_h(x_v(2:end-5))) / 12*xdelta^2;
end

