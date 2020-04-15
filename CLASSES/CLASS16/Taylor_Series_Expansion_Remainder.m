function [Remainder] = Taylor_Series_Expansion_Remainder(y_sym,xmin,xmax,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    Remainder = sym(0);
    
    if (xmin > xmax) 
        disp('Error: xmin must be less than xmax!');
    elseif (n < 0) 
        disp('Error: n must be greater than or equal to 0!');
    else
        h = xmax - xmin; % x_delta      
        f_current = y_sym;
        
        Remainder = diff(f_current)*h;
        
        for order = 1 : 1 : n             
            Remainder = Remainder + (diff(diff(f_current)) * h^order)/factorial(order);
        end   
    end
end

