%% HW Problem 6.19
% Figure P6.19 shows a circuit with a resistor, and inductor, and a
% capacitor in parallel. Kirchoff's rules can be used to express the
% impedance of the system as
% 1/Z = sqrt((1/R^2) + (wC - (1/(w*L))^2))
% where Z = impedance (ohms), and w is the angular frequency. Find the w
% that results in an impedance of 100 ohms using the fzero function with
% initial guesses of 1 and 1000 for the following parameters:
% R = 225 ohms, C = 0.6x10^-6 F, and L = 0.5 H.

syms w;
Z = 100; % ohms
R = 225; % ohms
C = 0.6 * 10^-6; % F
L = 0.5; % H
circuit = -(1/Z) + sqrt((1/R^2) + (w*C - (1/(w*L)))^2);

options = optimset('Display', 'iter', 'PlotFcns', @optimplotfval);
fzero(matlabFunction(circuit), [1 1000], options);