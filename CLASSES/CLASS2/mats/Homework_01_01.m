%% Continuous delivery or loading of a "ribbon" on a spool

v_init = 1; % ft/s (constant)
r_min = .5; % ft
r_max = 1; % ft
t_material = .01; % ft

t_init = 0;
t_delta = .1;
t_vector = [];

theta_init = 0;
theta_time = [];

omega_init = v / (2 * pi() * r_min);
omega_time = [];

% plot v as a function of time (should be constant)
% plot omega as a function of time
% plot omega as a function of layer_count
