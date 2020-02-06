function grade = lettergrade_v2(score)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    grade = 'N/A';
    
    switch true
        case (~isnumeric(score))
            disp('Error: please enter number.');
        case (numel(score) ~= 1)
            disp('Error: please enter single grade.');
        case (score < 0)
            disp('Error too low!');
        case (score > 100)
            disp('Error: Number too high!');
        otherwise
                % behave just like else in and if..elseif..else..end
        
    end
end

