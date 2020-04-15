% Example 4.4: Approximation of Derivatives
% use symbolic toolbox

syms x;
y = -0.1*x^4 - 0.15*x^3 - 0.5*x^2 - 0.25*x + 1.2;
y_prime = diff(y);

x_eval = 0.5; % value to evaluate derivative at 
h = 0.5; % x_delta
x_vector = [(x_eval - h), (x_eval), (x_eval + h)]; %x_i-1, x_i, x_i+1

% calculating value of y(x) for each value in x_vector 
eval(subs(y, x, x_vector))

y_handle = matlabFunction(y);
y_prime_handle = matlabFunction(y_prime);

y_vector = y_handle(x_vector); % f(x_i-1), f(x_i), f(x_i+1)

% forward difference
forward_diff = (y_vector(3) - y_vector(2) / h);
y_prime_actual = y_prime_handle(x_eval);
forward_diff_err = abs((y_prime_actual - forward_diff) / y_prime_actual)

% backward difference
backward_diff = ((y_vector(2) - y_vector(1)) / h)
backward_diff_error = abs((y_prime_actual - backward_diff) / y_prime_actual)

% center_diff 
center_diff = ((y_vector(3) - y_vector(1)) / (2*h))
center_diff_error = abs((y_prime_actual - center_diff) / y_prime_actual)

% see the xample of 2nd derv at end of 4.3.4