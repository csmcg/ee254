% from test: threhold epsilon = 0.0001
% function, interval[a,b], "method" (highlight quickest), n, area, error
% 
% y=floor(x)        [0,10]
% y=3x              [0,10]
% y=x^3+2x^2+x      [0,1]
% y=cos(x)          [0,pi]

% structure:
% for each function f1-f4
%   run each quadrature method
%       until error meets threshold
clear;clc;
syms x;

f1.f = floor(x);
f1.deriv2 = @(x) 0;
f1.deriv4 = @(x) 0;
f1.deriv6 = @(x) 0;

f2.f = 3*x;
f2.deriv2 = matlabFunction(diff(f2.f, 2), 'Vars', [x]);
f2.deriv4 = matlabFunction(diff(f2.f, 4), 'Vars', [x]);
f2.deriv6 = matlabFunction(diff(f2.f, 6), 'Vars', [x]);

f3.f = x^3 + 2*x^2 + x;
f3.deriv2 = matlabFunction(diff(f3.f, 2), 'Vars', [x]);
f3.deriv4 = matlabFunction(diff(f3.f, 4), 'Vars', [x]);
f3.deriv6 = matlabFunction(diff(f3.f, 6), 'Vars', [x]);

f4.f = cos(x);
f4.deriv2 = matlabFunction(diff(f4.f, 2), 'Vars', [x]);
f4.deriv4 = matlabFunction(diff(f4.f, 4), 'Vars', [x]);
f4.deriv6 = matlabFunction(diff(f4.f, 6), 'Vars', [x]);


% table:
% function | method | n | error | xmin | xmax | area

threshold = 0.001;

fxns = [f1, f2, f3, f4];

for f_index = [1:4] % for each function we are testing
    % setup limits
    if f_index <= 2
        xmin = 0;
        xmax = 10;
    elseif f_index == 3
        xmin = 0;
        xmax = 1;
    elseif f_index == 4
        xmin = 0;
        xmax = pi;
    end
    
    for method_index = [1:6] % rectangular, trapezoid, simpson's 1/3, simpson's 3/8, boole's, 5 segment

        switch method_index
            case 1 % rectangular
                n_current = 0;
                area_delta = threshold * 2;
                area_previous = 0;                
                area_n_rect = [];
                error_n_rect = [];
                
            case 2 % trapezoid
                n_current = 0;
                area_delta = threshold * 2;
                area_previous = 0;

                while (area_delta > threshold)
                    n_current = n_current + 1;
                    [area_n_trap(f_index, n_current), error_n_trap(f_index, n_current)] = trapezoidal(matlabFunction(fxns(f_index).f), fxns(f_index).deriv2, 0, 10, n_current);
                    area_delta = area_n_trap(n_current) - area_previous;
                    area_previous = area_n_trap(f_index, n_current);
                end
            
            case 3 % simpson's 1/3
                n_current = 0;
                area_delta = threshold * 2;
                area_previous = 0;                
%                 area_n_simpson13 = [];
%                 error_n_simpson13 = [];
            
            
            case 4 % simpson's 3/8
                n_current = 0;
                area_delta = threshold * 2;
                area_previous = 0;                                
%                 area_n_simpson38 = [];
%                 error_n_simpson38 = [];
%             
            
            case 5 % boole's
                n_current = 0;
                area_delta = threshold * 2;
                area_previous = 0;                                
%                 area_n_booles = [];
%                 error_n_booles = [];
            
            
            case 6 % 5-segment
                n_current = 0;
                area_delta = threshold * 2;
                area_previous = 0;                                
%                 area_n_5seg = [];
%                 error_n_5seg = [];
        end
                
        
        
    end
end

