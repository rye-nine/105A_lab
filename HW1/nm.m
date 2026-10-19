% This function was downloaded from the files on Canvas

function [root, nits, x] = nm(f, df, x0, N, tol)
% nm_lab finds a root of f(x) = 0 using the Newton's method.
% Inputs:
% f - Function handle representing f(x)
% df - Function handle representing the derivative of f, df(x)
% x0 - Initial guess for the root
% N - Maximum number of iterations
% tol - Tolerance for convergence (default value: 1.0e-9)
if nargin < 4 || isempty(N)
    N = 30; % Default number of iterations
end
if nargin < 5
    tol = 1.0e-9; % Default tolerance
end
x(1) = x0; % Initial guess for x
nits = 0;
for i = 1:N
    fx = f(x(i));
    dfx = df(x(i));
    if abs(fx) < tol
        root = x(i);
        return;
    end
    if dfx == 0
        error('Derivative is zero. No convergence.');
    end
    dx = -fx / dfx;
    x(i+1) = x(i) + dx;
    nits = i;
    if abs(dx) < tol
        root = x(i+1);
        return;
    end
end
error('Too many iterations in Newton''s method.');
end