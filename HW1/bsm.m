% This function was downloaded from the files on Canvas

function [root, n,p] = bsm(f, x1, x2, switch_val, tol)
% Bisection method to find root of function f
% root = bisection(f, x1, x2, switch_val, tol)
% Inputs:
% f - function handle
% x1, x2 - interval endpoints (root is bracketed in (x1, x2))
% switch_val - 1 to stop if error increases, 0 to ignore error increase
% tol - tolerance level for convergence
if nargin < 4
    switch_val = 0; % default switch value
end
if nargin < 5
    tol = 1e-9; % default tolerance
end
f1 = f(x1);
if f1 == 0
    root = x1;
    return;
end
f2 = f(x2);
if f2 == 0
    root = x2;
    return;
end
if sign(f1) == sign(f2)
    error('Root is not bracketed in the interval.');
end
n = ceil((log10(abs(x2 - x1)) - log10(tol))/log10(2));
for i = 1:n
    x3 = x1 + 0.5*(x2 - x1);

    %EDITED:
    p(i) = x3;

    f3 = f(x3);
    if (switch_val == 1) && (abs(f3) > abs(f1)) && (abs(f3) > abs(f2))
        root = NaN;
        return;
    end
    if f3 == 0
        root = x3;
        return;
    end
    if sign(f2) ~= sign(f3)
        x1 = x3;
        f1 = f3;
    else
        x2 = x3;
        f2 = f3;
    end
end
root = x1 + 0.5*(x2 - x1);
end