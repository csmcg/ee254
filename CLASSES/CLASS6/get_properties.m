function [properties] = get_properties(FormulaHandle,xmin, xmax, xdelta)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    % formulahandle (functionhandle) allow ou to pass functin as argument
    % at runtime
    
    x = [xmin : xdelta : xmax]; % vector of doubles
    y = FormulaHandle(x);
    
    properties.max = max(y);
    properties.min = min(y);
    properties.mean = mean(y);
    
end

