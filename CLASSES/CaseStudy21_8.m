% Do the partial derivative numerically and symbolically

% Employ the gradient function to determine partial derivatives for the
% following two-dimensional function:

% symbolic
syms x y;
f_sym = y - x - 2*x.^2 - 2*x*y - y.^2;

% from x = -2 to 2 and y = 1 to 3

% numeric
[x,y] = meshgrid(-2:.25:0, 1:.25:3);
f_num = @(x,y) y - x - 2*x.^2 - 2*x*y - y.^2;

z = f_num(x,y);

[fx, fy] = gradient(z,0.25);

cs = contour(x,y,z);
clabel(cs); hold on;

quiver(x,y,-fx,-fy);
hold off;



