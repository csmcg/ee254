%% HW Problem 5.24
% According to Archimedes' principle, the buyancy force is equal to the
% weight of fluid displaced by the submerged portion of the object. For the
% sphere depicted in Fig. P5.24, use bisection to determine the height, h,
% of the portion that is above water. Employ the following values for your
% computation. r = 1m, rho_s = density of sphere = 200 kg/m^3, rho_w =
% density of water = 1000 kg/m^3. Note that the voume of the above-water
% portion of the sphere can be computed with
% V = ((pi*h^3)/3)*(3*r - h)

r = 1; % m - radius of sphere
rho_sphere = 200; % kg/m^3
rho_water = 1000; % kg/m^3
syms h;
g = 9.8; % m/s^2

V = (4*pi*r^3) / 3;
V_above_water = ((pi.*h.^2) ./ 3) * (3*r - h);
% archimede's principle:  p_w * V_s * g = p_s * (V_s - V_a_w) * g

% Finding the equilibrium in terms of height

f = V*(rho_water - rho_sphere) - rho_water*V_above_water;

handle = fplot(f,[0 2]);
ax = ancestor(handle, 'axes');
ax.YAxis.Exponent = 0;
ytickformat('%.0f');

[root_approx, x_ideal, y_val, iter] = ... 
    Bisection_by_symbolic(f, h, 0, 2, .5, 20);

fprintf("Height of sphere above water: %.3f\n", root_approx);
fprintf("vpasolve for root results: %.3f\n", x_ideal);
fprintf("Error: %.3f%%\n", abs((x_ideal - root_approx)/x_ideal) * 100);
fprintf("Number of iterations: %d\n", iter)

