%% Question 1

% Using fixed-point iteration:
g = @(x) (x ./ 2) + (1 ./ x);
init_guess_fpm = 1;
tolerance = 10e-5;

[root_1, nits_1] = fpm(g, init_guess_fpm, [], tolerance);
fprintf('Root: %.6f\nIterations: %d\n', root_1, nits_1);

% Using Newton's Method
f = @(z) z - g(z);
df = @(n) (0.5) + (1 ./ (n^2));
init_guess_nm = 2;

[root_2, nits_2] = nm(f, df, init_guess_nm, [] ,tolerance);
fprintf('Root: %.6f\nIterations: %d\n', root_2, nits_2);
%% Question 2

g = 32.17;
s_0 = 300;
m = 0.25;
k = 0.1;

s = @(t) s_0 - (m * g / k) * t + ((m * m * g)*(1 - exp(-1 * k * t ./ m)))/(k*k);

% Utilize fixed-point iteration

s_guess = 3; 
s_tolerance = 10e-3;

[s_root, s_nits] = bsm(s, 0, 10, 1, s_tolerance);
fprintf('Time when object reaches the ground: %.6f seconds\nIterations: %d\n', ...
    s_root, s_nits);