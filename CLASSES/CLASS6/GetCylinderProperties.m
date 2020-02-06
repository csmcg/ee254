function [area , perimeter, volume] = GetCylinderProperties(radius, height)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % check to see if size(radius) == size(height), 
    % or that one or other are scalars
    
    % how do we check that two input arugments are 
    %   same size
    %   scalar times vector/array
    %   vector/array times scalar
    
    area = GetCylinderArea(radius,height);
    perimeter = GetCylinderPerimeter(radius);
    volume = GetCylinderVolume(radius, height);
end

function [area] = GetCylinderArea(radius, height)
    area = (2*pi*radius.^2) + (GetCylinderPerimeter(radius) .* height);
end

function [volume] = GetCylinderVolume(radius, height)
    volume = (pi * radius .^ 2 .* height);
end

function [perimeter] = GetCylinderPerimeter(radius)
    perimeter = 2*pi*radius;
end
