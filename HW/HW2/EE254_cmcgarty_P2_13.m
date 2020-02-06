%% Connor McGarty, cmcgarty - HW2 P2.13 from Chapra Text
%
% File: EE254_cmcgarty_P2_13.m
%
% Date: Submitted Thursday, February 6, 2020 - 2/06/20
%
% Problem P2.13: If a force 
% $F(N)$
% is applied to compress a spring, its displacement
% $x(m)$
% can often be modeled by Hooke's law:
%
% $$F=kx$$
%
% where 
% $k=$
% the spring constant (N/m). The potential energy stored in the spring
% $U(J)$
% can then be computed as
%
% $$U=\frac{1}{2}kx^2$$
%
% Five springs are tested and the following data compiled:
% F (N): 14, 18, 8, 9, 13
% x (m): 0.013, 0.020, 0.009, 0.010, 0.012
%
% Use MATLAB to store
% $F$
% and 
% $x$
% as vectors and then compute vectors of the spring constants and the
% potential energies. Use the max() function to determine the maximum
% potential energy.

%% Solution
clear;clc;

force_tested = [14 18 8 9 13]; % N
displacement_tested = [0.0013 0.020 0.009 0.010 0.012]; % m
spring_constants = [];
potential_energies = [];

for index = 1:1:length(force_tested)
    spring_constants(index) = force_tested(index) ./ ...
                              displacement_tested(index);
    potential_energies(index) = 0.5 .* spring_constants(index) .*  ...
                                sqrt(displacement_tested(index));
end

spring_constants
potential_energies
max_potential_energy = max(potential_energies)