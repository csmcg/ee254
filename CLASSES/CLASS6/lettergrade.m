function grade = lettergrade(score)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    grade = 'N/A';

    if ~isnumeric(score)
        disp('Score is not a number');
    elseif (numel(score) ~= 1)
        disp('Enter a single score.');
    end

    if (score < 0)
        disp('Error: Number too low.');
    elseif (score > 100)
        disp('Error: Number too high.');
    else
    end
        
        
    if ((score <= 100) && (score >= 90))
        grade = 'A';
    elseif ((score < 90) && (score >= 80))
        grade = 'B';
    elseif ((score < 80) && (score >= 70))
        grade = 'C';
    elseif ((score < 70) && (score >= 60))
        grade = 'D';
    elseif (score < 60 && (score >= 0))
        grade = 'F';
    else
        % only can get here if non above is true, implied false
    end
        
end

