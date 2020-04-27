close all; clear; clc;
syms x;
y = exp(-2*x) - x;


%fplot(y)
xmin = 0.5;
xmax = 6;
xdelta = [.5 .4 .3 .2 .1 .01];
index = 0;

for step = xdelta
    index = index + 1;
    
    back{index} = backward(y, xmin, xmax, step);
    cent{index} = center(y, xmin, xmax, step);
    forw{index} = forward(y, xmin, xmax, step);
    
    figure;
    ylim([-2 -.8]);
    hold on;
    fplot(diff(y),[xmin xmax], 'k');
    if (index == length(xdelta))
        plot([xmin+(2*step):step:xmax-(2*step)], cent{index}, 'r');
        plot([xmin+(2*step):step:xmax], back{index}), 'o';
        plot([xmin:step:xmax-(2*step)], forw{index}), 'g';
    else
        plot([xmin+(2*step):step:xmax-(2*step)], cent{index}, 'r+');
        plot([xmin+(2*step):step:xmax], back{index}, 'm<');
        plot([xmin:step:xmax-(2*step)], forw{index}, 'g>');
    end
    
    title(['Step = ', num2str(step)]);
end

% subplot(6,1,1) % xdelta(1), step == .5
% fplot(diff(y),[xmin xmax]); % actual 1st deriv
% hold on;
% plot([xmin:step(1):xmax], results{1}{1,10}, 'r+'); %center method 1
% plot([xmin:step(1):xmax-step(1)], results{1}{1,4}, 'o+');


function res = center(y, xmin, xmax, step)
    y_h = matlabFunction(y);
    x_v = [xmin:step:xmax];
    
    res = (-1.*(y_h(x_v(5:end))) + 8.*(y_h(x_v(4:end-1))) ...
        - 8.*(y_h(x_v(2:end-3))) + (y_h(x_v(1:end-4)))) ./ (12*step);
end

function res = backward(y, xmin, xmax, step)
    y_h = matlabFunction(y);
    x_v = [xmin:step:xmax];
    
    res = (3.*y_h(x_v(3:end)) - 4.*y_h(x_v(2:end-1)) + y_h(x_v(1:end-2))) ./ (2*step);
end

function res = forward(y, xmin, xmax, step)
    y_h = matlabFunction(y);
    x_v = [xmin:step:xmax];
    
    res = (-y_h(x_v(3:end)) + 4.*(y_h(x_v(2:end-1))) - 3.*(y_h(x_v(1:end-2)))) ./ (step*2);
end
