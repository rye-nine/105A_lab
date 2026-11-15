function [root, nits, p] = sadm_lab(g, x0, N, tol)
    % sadm_lab is Steffensen's method that accelerates
    % the convergence of a fixed-point iteration
    % using Aitken's method.
    % Inputs:
    %   g          - Function handle representing g(x)
    %   x0         - Initial guess for the fixed point
    %   N          - Maximum number of iterations
    %   tol        - Tolerance for convergence (default: 1.0e-9)

    if nargin < 3 || isempty(N)
        N = 100; % Default number of iterations
    end
    if nargin < 4
        tol = 1.0e-9; % Default tolerance
    end

    nits = 0;
    x1 = g(x0);
    if x1 == x0
        root = x0;
        p = x0;
        return;
    end
    
    for i = 1:N-2
        
        x2 = g(x1);
        
        p(i) = x0 - ((x1 - x0)^2)/(x2 - 2*x1 + x0);

        nits = i;

        if i > 1 && abs(p(i) - p(i-1)) < tol
            root = p(i);
            return;
        end
        
        x0 = p(i);
        x1 = g(x0);
    end
    
    error('Aitken method exceeded maximum number of iterations.');
end
