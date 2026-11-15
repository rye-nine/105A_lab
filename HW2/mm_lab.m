function [root, nits, p] = mm_lab(f, p0, p1, p2, N, tol)
    % mm_lab finds a root of f(x) = 0 using Muller's method.
    % Inputs:
    %   f   - Function handle of f(x)
    %   p0  - First initial approximation
    %   p1  - Second initial approximation
    %   p2  - Third initial approximation
    %   N   - Maximum number of iterations
    %   tol - Tolerance for convergence (default value: 1.0e-9)

    if nargin < 5 || isempty(N)
        N = 30; % Default number of iterations
    end
    if nargin < 6
        tol = 1.0e-9; % Default tolerance
    end

    p(1:3) = [p0, p1, p2];
    nits = 0;

    for i = 1:N
        h1 = p1 - p0;
        h2 = p2 - p1;
        delta1 = (f(p1) - f(p0))/h1;
        delta2 = (f(p2) - f(p1))/h2;
        d = (delta2 - delta1)/(h2 + h1);

        b = delta2 + h2*d;
        D = sqrt(b^2 - 4*f(p2)*d);

        if abs(b + D) > abs(b - D)
            E = b + D;
        else
            E = b - D;
        end

        h = -2*f(p2)/E;
        p3 = p2 + h;
        p(i+3) = p3;
        nits = i;

        if abs(h) < tol
            root = p3;
            return;
        end

        p0 = p1;
        p1 = p2;
        p2 = p3;
    end

    error('Too many iterations in Muller''s method.');
end
