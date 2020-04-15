%% False Position Demo

clear;
clf;

plot_refresh = true;

syms x;
y_sym = sin( 10*x ) + cos( 3*x )
y_handle = matlabFunction( y_sym )

x_min = 3.2;
x_max = 3.3;
x_delta = .001;
threshold = .001;
n_max = 1000;
n_current = 0;
e_t = 2 * threshold;
e_t_vector = []
x_fp_vector = [];

% plot the original function...
subplot( 2, 1, 1 )
x_vector = [ x_min : x_delta : x_max ];
plot( x_vector, y_handle( x_vector ) );
hold on;
plot( x_min, y_handle( x_min ), 'marker', 'o', 'color', 'k' )
text( x_min, y_handle( x_min ), [ 'x\_min = ' num2str(x_min) ] );
plot( x_max, y_handle( x_max ), 'marker', 'o', 'color', 'k' )
text( x_max, y_handle( x_max ), [ 'x\_max = ' num2str(x_max) ] );
grid on;

x_root_vpa = vpasolve( y_sym == 0, x, [ x_min x_max ] )
plot( x_root_vpa, y_handle(x_root_vpa), 'marker', 'o', 'color', 'r' )

while ((abs(e_t) >= threshold) && (n_current <= n_max)) 
    n_current = n_current + 1;
    
    % pl1 - line connecting x_min and x_max
    pl1 = line( [ x_min x_max ], [ y_handle(x_min) y_handle(x_max) ] );
    % calculate, plot x_fp and draw a line perpendicular to the x-axis
    x_fp = x_max - ((y_handle(x_max) * (x_min-x_max)) / (y_handle(x_min) - y_handle(x_max)));
    plot( x_fp, y_handle( x_fp ), 'marker', 'o', 'color', 'b' )
    text( x_fp, y_handle( x_fp ), { ['n = ' num2str( n_current ) ] [ 'x\_fp = ' num2str(x_fp) ] } );
    pl2 = line( [ x_fp x_fp ], [ y_handle( x_fp ) 0 ]);    
    % set x_min or x_max depending on which y = f(x) yields a value with
    % the same sign as y = f(x_fp)
    % Therefore,
    if ((y_handle(x_fp) / abs(y_handle(x_fp))) == (y_handle(x_min) / abs(y_handle(x_min))))
        x_min = x_fp;
    else
        x_max = x_fp;
    end
    e_t = x_root_vpa - x_fp;
    x_fp_vector( n_current ) = x_fp;
    e_t_vector( n_current ) = e_t;
    
    if (plot_refresh == true)
        pl1.delete; % optional delete
        pl2.delete; % optional delete        
    end    
end

x_root_approx = x_fp;

subplot( 2,1,2 )
plot( [ 1 : n_current ], e_t_vector );

hold off;