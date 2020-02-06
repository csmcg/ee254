function [ Area, n ] = GetAreaByConvergenceThreshold( FormulaHandle, xmin, xmax, Threshold, nmin, nmax )
%GETAREABYCONVERGENCETHRESHOLD_V2 Summary of this function goes here
%   Detailed explanation goes here
    
    % must have return values.
    Area = NaN;    
    n = NaN;
    
    if (isempty(FormulaHandle) == true)
        disp('Error: Please provide a FormulaHandle!');
        % Need more error checking here before using eval statement.
    elseif (xmin >= xmax )
        disp('Error: Please provide an xmin < xmax!');
    elseif (Threshold <= 0)
        disp('Error: Please provide a positive Threshold!');
    elseif (isinteger( nmin ) == false) || (isinteger( nmax ) == false) || ...
        any(size( nmin ) ~= [ 1 1 ]) || any(size( nmax ) ~= [ 1 1 ]) || ...    
        (nmin < 2) || (nmax <= nmin)            
        disp('Error: Please provide positive integer values for nmin and nmax s.t. nmin < nmax!');         
    else
        n = nmin
        try
            AreaPrevious = 0;
            AreaDelta = 2 * Threshold;                       
            
            % AreaDelta >= Threshold --> checks to see if area is converging...
            % (nmin == (n - 1)) --> handles edge case initial y(x(0)) == 0
            % n <= nmax --> prevents an infinite loop
            
            while (((AreaDelta >= Threshold) || (nmin == (n - 1))) && (n <= nmax))
                x = linspace( xmin, xmax, n );
                % assumes y = f(x);
                % Need to consider checking size/length of x and y.                
                Area = 0;
                for Index = 1 : 1 : length( x ) - 1
                    Area = Area + (x( Index + 1 ) - x( Index )) * (FormulaHandle( x( Index ) ) - 0);
                end
                AreaDelta = abs( AreaPrevious - Area )
                AreaPrevious = Area;
                n = n + 1;
            end
            % Once we know the condition is met, subtract one from the 
            % final count.  Note: this could also be handled as an if 
            % statement inside the loop.
            n = n - 1;
        catch err
            disp(['Error: ' err.message ]);
            Area = NaN;
            n = NaN;
        end
    end          
end

