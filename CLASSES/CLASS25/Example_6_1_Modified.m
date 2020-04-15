%% Example 6.1 (modified): Simple Fixed-Point Iteration
% Problem statement.  Use simple fixed-point iteration to locate the root
% of f(x) = e^-x - x;
clear;clc;close all;
plot_refresh = false;

syms x;
y = exp(-x) - x;
y_handle = matlabFunction( y )
x_root_vpa = vpasolve( y == 0, x, .50 )

% rearranging yields...
g_handle = @(x) exp(-x);
% note: _next --> i+1, _prev --> i-1;
x_i = 0;
e_t_i = 100; % 100% error in the original step

% using a for loop for a predetermined number of iterations
n = 10;

disp( sprintf('---------------------------------------------------------------------------'));
disp( sprintf(' i     x_i      |e_a|,%%        |e_t|,%%     |e_t_i|/|e_t_prev|'));
disp( sprintf('---------------------------------------------------------------------------'));
disp( sprintf('%2d   %8.4f   %8.4f       %8.4f   %8.4f', 0, 0.0, NaN, e_t_i, NaN));

e_t_i_vector( 1 ) = e_t_i; % note: index shifting
e_a_vector( 1 ) = NaN;
x_i_vector( 1 ) = x_i;

for index = 1 : n
    x_next = g_handle(x_i);   
    e_a = abs((x_next - x_i) / x_next) * 100;
    e_t_prev = e_t_i;    
    e_t_i = abs((x_next - x_root_vpa) / x_root_vpa) * 100;
    disp( sprintf('%2d   %8.4f   %8.4f       %8.4f   %8.4f', index, x_next , e_a, e_t_i, e_t_i / e_t_prev ));        
    x_i = x_next;
    
    e_t_i_vector( index + 1 ) = e_t_i; % note: index shifting
    e_a_vector( index + 1 ) = e_a;
    x_i_vector( index + 1 ) = x_i;
end
disp( sprintf('---------------------------------------------------------------------------'));

x_root_approx = x_i;

subplot( 3,1,1 )
x_min = min( x_i_vector );
x_max = max( x_i_vector );
x_vector = [ x_min : ((x_max - x_min) / 100) : x_max ]
y_vector = y_handle( x_vector);
plot( x_vector, y_vector )
grid on;
hold on;


for index = 1 : length( x_i_vector )
    plot( x_i_vector( index ), 0, 'marker', 'o', 'color', 'b' )
    pl1 = line( [ x_i_vector( index ) x_i_vector( index ) ], [ 0 y_handle(x_i_vector( index )) ] );
    pause;
    if (plot_refresh == true)
        pl1.delete; % optional delete
    end
end

subplot( 3,1,2 )
grid on;
hold on;
for index = 1 : length( x_i_vector )
   plot( index, e_a_vector( index ), 'marker', 'o', 'color', 'b' )   
end

subplot( 3,1,3 )
grid on;
hold on;
for index = 1 : length( x_i_vector )
   plot( index, e_t_i_vector( index ), 'marker', 'o', 'color', 'r' ) 
end

hold off;

