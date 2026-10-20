%% Clean-up before running
clear;
clc;
%% Question 1

% Using fixed-point iteration:
g = @(x) (x ./ 2) + (1 ./ x);
init_guess_fpm = 1;
tolerance = 10e-5;

[root_1, nits_1, p_fpm] = fpm(g, init_guess_fpm, [], tolerance);
fprintf('Root: %.6f\nIterations: %d\n', root_1, nits_1);

% Calculate convergence order of fixed-point iteration:
for it = 1:length(p_fpm)-2
    err_fpm(it) = abs(p_fpm(it+2) - p_fpm(it+1))/abs(p_fpm(it+1) - p_fpm(it));
end
for it = 1:length(err_fpm)-1
    rate_fpm(it) = log(err_fpm(it+1))/log(err_fpm(it));
end

fprintf('[Fixed-point iteration] Rate of convergence: %.6f\n', rate_fpm(end));

% Create a plot:
fpm_error = root_1 - p_fpm;
figure;
plot(p_fpm, fpm_error, "o")

hold on;

yline(0, 'k--');
ylim([-0.2, 0.7]);    
xlim([0.8, 1.7]);

title("Fixed-point iteration: p vs actual error (p-p*)");
xlabel('p');
ylabel('actual error (p-p*)');
hold off;

grid on;


% Using Newton's Method
f = @(z) z - g(z);
df = @(n) (0.5) + (1 ./ (n^2));
init_guess_nm = 2;

[root_2, nits_2, p_nm] = nm(f, df, init_guess_nm, [] ,tolerance);
fprintf("Root: %.6f\nIterations: %d\n", root_2, nits_2);

% Calculate convergence order of Newton's method:

for it = 1:length(p_nm)-2
    err_nm(it) = abs(p_nm(it+2) - p_nm(it+1))/abs(p_nm(it+1) - p_nm(it));
end
for it = 1:length(err_nm)-1
    rate_nm(it) = log(err_nm(it+1))/log(err_nm(it));
end

fprintf("[Newton's method] Rate of convergence: %.6f\n", rate_nm(end));

% Create a plot:
nm_error = root_2 - p_nm;
figure;
plot(p_nm, nm_error, "o")

hold on;

yline(0, 'k--');
ylim([-0.6, 0.1]);    
xlim([1.1, 2.1]);

title("Newton's method: p vs actual error (p-p*)");
xlabel('p');
ylabel('actual error (p-p*)');
hold off;

grid on;



%% Question 2

% Define constants:
g = 32.17;
s_0 = 300;
m = 0.25;
k = 0.1;

s = @(t) s_0 - (m * g / k) * t + ((m * m * g)*(1 - exp(-1 * k * t ./ m)))/(k*k);

% Utilize fixed-point iteration

s_guess = 3; 
s_tolerance = 10e-3;

[s_root, s_nits, p_bsm] = bsm(s, 0, 10, 1, s_tolerance);
fprintf('Time when object reaches the ground: %.6f seconds\nIterations: %d\n', ...
    s_root, s_nits);

% Create a plot:
bsm_error = s_root - p_bsm;
figure;
plot(p_bsm, bsm_error, "o")

hold on;

yline(0, 'k--');
ylim([-1.7, 1.25]);    
xlim([4.8, 7.7]);

title("Bisection method: p vs actual error (p-p*)");
xlabel('p');
ylabel('actual error (p-p*)');
hold off;

grid on;

