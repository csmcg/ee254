%% Connor McGarty, cmcgarty - HW01: CONTINUOUS LOADING OF WIRE ON A SPOOL
% File: cmcgarty_EE254_HW01_WIRE_LOADING.m
%
% Submission Date: Thursday, January 30, 2020 - 1/30/20
%
% Problem: Determine 
% $\omega(t)$
% (angular velocity of spool) loading a length of wire such that 
% $v(t)$
% (velocity of wire) is constant. Plot 
% $\omega(t)$
% .

%% Parameters 

% Define parameters (chosen by myself)
clear;clc;close all;
r_spool_min = 3; % ft - diameter of empty spool
r_spool_max = 10; % ft - diameter of full spool
w_spool = 3; % ft - width of spool
r_wire = .25; % ft - wire radius
h_w = sqrt(3) * r_wire; % distance between midpoint of one layer to the next
r_current = r_spool_min;
layer_count = 1; % number of full turns around the spool

v_constant = 1; % m/s
t_init = 0; % s 
t_delta = .1; % s
t_vector = [t_init]; % s 

theta_init = 0; % rad
theta_current = theta_init;

omega_init = v_constant / r_spool_min; % rad/s
omega_time = [omega_init]; % rad/s
omega_current = omega_init;
% depending on even/odd layer, affects # turns. 
% odd layer = round(w_spool/r_wire),
% even layer = round(w_spool/r_wire) - 1
turns_per_layer = round(w_spool / r_wire); % first layer is odd (1)
turns_current = 0; % count turns for current layer

iteration = 1;
done = false; % loop flag

%% Algorithm

while (done == false)
    iteration = iteration + 1;

    omega_current = v_constant / r_current;
    omega_time(iteration) = omega_current;
    
    theta_previous = theta_current;
    theta_current = theta_previous + omega_current * t_delta;
    t_vector(iteration) = t_vector(end) + 1;
    
    % FIX THIS LINE (if)
    if (theta_current >= (2*pi))
        theta_current = theta_current - 2*pi;
        turns_current = turns_current + 1;
    end
    
    if (turns_current > turns_per_layer)
        turns_current = 0;
        layer_count = layer_count + 1;
        r_current = r_spool_min + (r_wire + (layer_count - 1) * h_w) + (.5 / h_w);
    end
    
    if (mod(layer_count,2) == 1)
        turns_per_layer = round(w_spool / r_wire);
    else
        turns_per_layer = round(w_spool / r_wire) - 1;
    end    
    

    if (r_spool_min + (r_wire + (layer_count - 1) * h_w) + (.5 * h_w) >= r_spool_max ...
        & turns_current == turns_per_layer)
        done = true;
    end
    
end

plot(t_vector,omega_time);
xlabel('Time (s)');
ylabel('\omega (rad/s)');
title('\omega(t) of spool loading wire at constant velocity');
axis([0, t_vector(end), 0, omega_time(1) + 0.05]);