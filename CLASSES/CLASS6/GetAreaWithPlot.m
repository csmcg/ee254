function [ Area_LHS, Area_RHS ] = GetAreaWithPlot( x, y )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

plot( x, y )
hold on

Area_LHS = 0; % red set
Area_RHS = 0; % blue set

for Index = 1 : 1 : length( x ) - 1
    % left hand side of rectangle
    rectangle( 'position', ...
        [ x( Index ),  0, ...
        (x( Index + 1 ) - x( Index )), ...
        (y( Index ) - 0) ], ...
        'EdgeColor','r')

    % right hand side of rectangle
    rectangle( 'position', ...
        [ x( Index ),  0, ...
        (x( Index + 1 ) - x( Index )), ...
        (y( Index + 1) - 0) ], ...
        'EdgeColor','b')
    
    Area_LHS = Area_LHS + (x( Index + 1 ) - x( Index )) * (y( Index ) - 0);
    Area_RHS = Area_RHS + (x( Index + 1 ) - x( Index )) * (y( Index + 1) - 0);
end
hold off

end

