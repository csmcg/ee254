%% Example 6.1: Simple Fixed-Point Iteration
% Problem statement.  Use simple fixed-point iteration to locate the root
% of f(x) = e^-x - x;

syms x;
y = exp(-x) - x;
x_root_vpa = vpasolve( y == 0, x, .50 ); % .50 - rough estimate of the root (ex: from bracketing approach)

% rearranging yields...
g_handle = @(x) exp(-x);
x_i = 0; % initial root 
e_t_i = 100; % 100% error in the original step
% note: _next --> i+1, _prev --> i-1;

% using a for loop for a predetermined number of iterations
n = 10;

disp( sprintf('---------------------------------------------------------------------------'));
disp( sprintf(' i     x_i      |e_a|,%%        |e_t|,%%     |e_t_i|/|e_t_prev|'));
disp( sprintf('---------------------------------------------------------------------------'));
disp( sprintf('%2d   %8.4f   %8.4f       %8.4f   %8.4f', 0, 0.0, NaN, e_t_i, NaN));
for index = 1 : n
    x_next = g_handle(x_i);   
    e_a = abs((x_next - x_i) / x_next) * 100; %eq. 6.3
    e_t_prev = e_t_i;    
    e_t_i = abs((x_next - x_root_vpa) / x_root_vpa) * 100;
    disp( sprintf('%2d   %8.4f   %8.4f       %8.4f   %8.4f', index, x_next , e_a, e_t_i, e_t_i / e_t_prev ));        
    x_i = x_next;
end
disp( sprintf('---------------------------------------------------------------------------'));

x_root_approx = x_i;