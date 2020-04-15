%% Bisection 

% Q: what mass bungee jumper would achieve v = 36 m/s at t = 4s

cd = .25; % drag coeff
g = 9.81; 
v = 36; % velocity at t=4s
t = 4; 
mp = linspace( 50, 200 );
fp = sqrt(g*mp/cd).*tanh(sqrt(g*cd./mp)*t) - v;
x_actual = 142.7376;
xmin = 50;
xmax = 200;
xmid = (xmin + xmax) / 2; % first estimation

% compare x_actual to the 1st estimation of the root

e_t = (abs(x_actual - xmid) / x_actual) * 100; % percent

% calculate f(xmin) * f(xmax)
% + * + = +, same sign
% + * - = -, diff sign
% - * + = -, diff sign
% - * - = +, same sign

% same sign
%   there is no root inbetween xmin and xmax (assume a good interval)
%   OR your interval is accidentally too large
% diff sign
%   at least one root exists b/t xmin and xmax
%   CANNOT guarantee only 1 root (unless you know something abt problem)
%
% then, pick a new bracket


syms m;
f = sqrt(g*m/cd).*tanh(sqrt(g*cd./m)*t) - v;

f_h = matlabFunction(f);
subplot(3,1,1);
fplot(f, [xmin, xmax]);

f_h(xmin) * f_h(xmid); % positive
% positive, so redesign lower bound as 125 (xmid)
xmin = 125;
xmid = (xmin + xmax) / 2;
e_t = (abs(x_actual - xmid) / x_actual) * 100; % percent
subplot(3,1,2);
fplot(f, [xmin xmax]);
f_h(xmin) * f_h(xmid); % negative, so there is at least one root
% so xmid becomes our new xmax
xmax = xmid;
xmin = xmin;
xmid = (xmax + xmax) / 2;
e_t = (abs(x_actual - xmid) / x_actual) * 100; % percent;
subplot(3,1,3);
fplot(f, [xmin xmax]);
f_h(xmin) * f_h(xmid); % negative -> change in sign, root in b/t


% summary
% start with xmin and xmax
% determine xmid
% calc f(xmin) * f(xmid)
% if ^ < 0 (change in sign)
    % have root b/t xmin and xmid
    % xmin = xmin;
    % xmax = xmid;
    % recalc xmid
% else (no change in sign) 
    % root b/t xmid and xmax, so:
    % xmin = xmid
    % xmax = xmax
    % recalc xmid
% end
    % go back to calc f(xmin) * f(xmid)
    
    
    
    
% VPA SOLVE
syms x;
y = cos(x);

solve(y == 0, x) % solve for y = 0 in terms of x, SINGLE ANSWER

% instead...
vpasolve(y == 0, x, [pi/4, 3*pi/4])
vpasolve(y == 0, x, [pi, 2*pi])





