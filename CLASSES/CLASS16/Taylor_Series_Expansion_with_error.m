function [y_approx,Error,Taylor,Remainder] = Taylor_Series_Expansion_with_error(y_sym,xmin,xmax,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

h = xmax - xmin;

Reaminder = sym(0);

syms x;
y_actual = eval(subs(y_sym, x, xmax));

if (xmin > xmax)
    disp('Error: xmin must be less than xmax');
elseif (n<0)
    disp('Error: n must be greater than or equal to 0');
else
    
    Taylor = y_sym;
    f_current = y_sym;
    Remainder = diff(f_current)*h; % 0th order approx. of Remainder
    % Figure 4.8
    
    for order = 1:1:n
        Taylor = Taylor + ((diff(f_current)*(h^order)) / (factorial(order)));
        Remainder = Remainder + (diff(diff(f_current)) * h^order)/factorial(order);
        f_current = diff(f_current);
    end
    y_approx = eval(subs(Taylor,x,xmin));
    % Example 4.3: Error calculation according to the example
    Error = abs((y_actual-y_approx) / y_actual);
end

