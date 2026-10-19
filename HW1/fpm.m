% This function was downloaded from the files on Canvas

function [root, nits] = fpm(g, x0, N, tol)
% fpm_lab finds a fixed point of the equation x = g(x) using iteration.
% Inputs:
% g - Function handle representing g(x)
% x0 - Initial guess for the fixed point
% N - # of iterations
% tol - Tolerance for convergence (default value: 1.0e-9)
if nargin < 3 || isempty(N)
    N = 100; % Default number of iterations
end
if nargin < 4
    tol = 1.0e-9; % Default tolerance
end
for i = 1:N
    x1 = g(x0); % Compute the next approximation using g(x)
    % Check for convergence
    if abs(x1 - x0) < tol
        root = x1;
        nits = i;
        return;
    end
    % Update the previous estimate
    x0 = x1;
end
error('Fixed point iteration exceeded maximum number of iterations.');
end