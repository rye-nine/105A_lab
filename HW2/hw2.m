%% Problem 1:

clear;
clc;

% Define functions
f = @(x) x * sin(x) + 3 * cos(x) - x;
g = @(t) t + 0.2 * f(t);

% Define starting endpoints
p_0 = 7.5;
p_1 = 8;

% Employ secant method
[root_1, nits_1, p_sm] = sm_lab(f, p_0, p_1, [], 10^(-8));

% calculate convergence
for it = 1:length(p_sm)-1
    consecutive_error_1(it) = abs(p_sm(it+1) - p_sm(it));
end
for it = 1:length(p_sm)-2
    err_sm(it) = abs(p_sm(it+2) - p_sm(it+1))/abs(p_sm(it+1) - p_sm(it));
end
for it = 1:length(err_sm)-1
    rate_sm(it) = log(err_sm(it+1))/log(err_sm(it));
end

fprintf('Secant method: root = %.6f, iterations = %d, estimated order = %.6f\n', ...
    root_1, nits_1, rate_sm(end));

% Aitken's method:
% Construct the sequence from the previous sequence
for it = 1:length(p_sm)-2 
    p_am(it) = p_sm(it) - ((p_sm(it+1)-p_sm(it))^2)/(p_sm(it+2) - 2 * p_sm(it+1) + p_sm(it));
end

% calculate convergence:
for it = 1:length(p_am)-1
    consecutive_error_2(it) = abs(p_am(it+1) - p_am(it));
end
for it = 1:length(p_am)-2
    err_am(it) = abs(p_am(it+2) - p_am(it+1))/abs(p_am(it+1) - p_am(it));
end
for it = 1:length(err_am)-1
    rate_am(it) = log(err_am(it+1))/log(err_am(it));
end

fprintf('Aitken method: estimated order = %.6f\n', ...
    rate_am(end));

% Steffensen's method:

q_0 = 7.5;
[root_3, nits_3, p_sadm] = sadm_lab(g, q_0, [], 10^(-8));


% calculate convergence:
for it = 1:length(p_sadm)-1
    consecutive_error_3(it) = abs(p_sadm(it+1) - p_sadm(it))
end

for it = 1:length(p_sadm)-2
    err_sadm(it) = abs(p_sadm(it+2) - p_sadm(it+1))/abs(p_sadm(it+1) - p_sadm(it));
end
for it = 1:length(err_sadm)-1
    rate_sadm(it) = log(err_sadm(it+1))/log(err_sadm(it));
end

fprintf('Steffensen method: root = %.6f, iterations = %d, estimated order = %.6f\n', ...
    root_3, nits_3, rate_sadm(end));

% Construct graphs:

subplot(1,3,1);
semilogy(1:length(consecutive_error_1),consecutive_error_1,'o-'); grid on; box on;
title('Secant method'); xlabel('Iteration'); ylabel('Consecutive error');

subplot(1,3,2);
semilogy(1:length(consecutive_error_2),consecutive_error_2,'o-'); grid on; box on;
title('Aitken method'); xlabel('Iteration'); ylabel('Consecutive error');

subplot(1,3,3);
semilogy(1:length(consecutive_error_3),consecutive_error_3,'o-'); grid on; box on;
title('Steffensen method'); xlabel('Iteration'); ylabel('Consecutive error');

%% Problem 2

clear; 
clc;

% Define all functions and starting points
P = @(z) z.^4 + (4 * z.^2) + 8;
p_0 = 0;
p_1 = 1;
p_2 = 2;

% Employ Muller's method
[root_1, nits_1, p_mm] = mm_lab(P, p_0, p_1, p_2, [], 10^(-9));

fprintf('Muller method: root = %.6f, iterations = %d\n', ...
    root_1, nits_1);

% Calculate consecutive errors
for it = 1:length(p_mm)-1
    consecutive_error(it) = abs(p_mm(it+1) - p_mm(it));
end

% Construct graphs

subplot(1,1,1)
semilogy(1:length(consecutive_error),consecutive_error,'o-'); grid on; box on;
title('Muller method'); xlabel('Iteration'); ylabel('Consecutive error');

% we know that the conjugate is also a zero
root_2 = conj(root_1);

% because P is even:

root_3 = -1 * root_1;
root_4 = conj(root_3);

fprintf('All roots:\n')
disp(root_1)
disp(root_2)
disp(root_3)
disp(root_4)
