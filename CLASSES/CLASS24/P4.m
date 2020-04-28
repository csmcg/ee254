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
format compact;    
syms x;
y1 = (x-1)*(x-(3/2))*(x-(7/4))*(x-(15/8))*(x-(31/16));
y2 = x^2 - 1;
y3 = x^6 - 1;
y4 = 20*cos((x*pi)/2);
y5 = -exp(x+1);

threshold = 0.001;
xmin = 0;
xmax = 2;
n_max = 1000;

disp(sprintf("Method\tFxn\t\tIdeal\tApprox\tf(x)\t|e_a|\tIterations"));
disp(sprintf("=================================================================================="));

%for i = [1:5]
for i = [1:4]
    switch i
        case 1
            f = y1;
            name = 'Poly';
        case 2
            f = y2;
            name = 'x^2 - 1';
        case 3
            f = y3;
            name = 'x^6 - 1';
        case 4
            f = y4;
            name = 'cos(xpi/2)';
        case 5
            f = y5;
            name = '-e^(x+1)';
    end
    
    % bisection
    method = "Bisect";
    [approx, e_a, actual, y, iter] = ... 
        Bisection_by_symbolic(f, x, xmin, xmax, threshold, n_max);
    disp(sprintf("%s\t%s\t\t%0.4f\t%0.4f\t%0.4f\t%0.4f\t%.0f", method, name, actual(1), approx, y, e_a(1), iter));                  
    disp(sprintf("----------------------------------------------------------------------------------"));
    % false position
    method = "FaPos";
    [approx, e_a, actual, y, iter] = False_Position_by_symbolic(f, x, xmin, xmax, threshold, n_max);
    disp(sprintf("%s\t%s\t\t%0.4f\t%0.4f\t%0.4f\t%0.4f\t%.0f", method, name, actual(1), approx, y, e_a(1), iter));                  
    disp(sprintf("----------------------------------------------------------------------------------"));
    % fixed point
    method = "FixPnt";
    [approx, e_a, actual, y, iter] = ... 
        Fixed_point_by_symbolic(f,x,threshold,n_max);
    disp(sprintf("%s\t%s\t\t%0.4f\t%0.4f\t%0.4f\t%0.4f\t%.0f", method, name, actual(1), approx, y, e_a(1), iter));                  
    disp(sprintf("----------------------------------------------------------------------------------"));
    % newton-raphson
    method = "NR";
    [approx, e_a, actual, y, iter] = ... 
        Newton_Raphson_by_symbolic(f,2*rand(1),threshold,n_max);
    disp(sprintf("%s\t%s\t\t%0.4f\t%0.4f\t%0.4f\t%0.4f\t%.0f", method, name, actual(1), approx, y, e_a(1), iter));                  
    disp(sprintf("----------------------------------------------------------------------------------"));
    % secant
    method = "Sec";
    [approx, e_a, actual, y, iter] = ... 
        Secant_by_symbolic(f,xmin,xmax,threshold,n_max);
    disp(sprintf("%s\t%s\t\t%0.4f\t%0.4f\t%0.4f\t%0.4f\t%.0f", method, name, actual(1), approx, y, e_a(1), iter));                  
    disp(sprintf("----------------------------------------------------------------------------------"));     
end