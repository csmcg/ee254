%% Connor McGarty, cmcgarty - P2.11, Chapra Text
% File: cmcgarty_P2_11.m
%
% Submission Date: Thursday, February 6 2020 - 2/6/2020
% 
% Problem P2.11: A simple electric circuit consisting of a resistor, a
% capacitor, and an inductor is depicted as shown in Fig. P2.11. The charge
% on the capacitor 
% $q(t)$
% as a function of time can be computed as 
%
% $$ q(t) = q_{0}e^{\frac{-Rt}{2L}}\cos[\sqrt{\frac{1}{LC}-(\frac{R}{2L})^{2}t}] $$
%
% where 
% $t=$
% time,
% $q_{0}=10$
% , the initial charge,
% $R=60$
% , the resistance, 
% %L=9$
% , the inductance, and
% $C=0.00005$
% , the capacitance. Use MATLAB to generate a plot of this function from 
% $t=0$
% to 
% $0.8$
% given the above. 

%% Solution
clear;clc;
initial_charge = 10; % coulombs
resistance = 60; % ohms
inductance = 9; % H
capacitance = 0.00005; % F
t_init = 0; % s
t_final = 0.8; % s
t_delta = 0.01; % s
t_vector = [t_init : t_delta : t_final];

q_time = initial_charge .* exp((-resistance .* t_vector) ./ (2 * inductance)) ...
    .* cos(sqrt((1 / inductance * capacitance) - ... 
    ((resistance / (2 * inductance)) .^ 2)) .* t_vector);

plot(t_vector, q_time);
xlabel('Time (s)');
ylabel('Charge on capacitor (C)');
ylim([0, 10]);
title('P2.11: Charge on capacitor as function of time');