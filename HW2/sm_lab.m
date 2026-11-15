function [root, nits, p_sm] = sm_lab(f, x0, x1, N, tol)
    % sm_lab solves the equation f(x) = 0 using the secant method.
    % Inputs:
    %   f       - Function handle representing f(x)
    %   x0      - First initial guess for the root
    %   x1      - Second initial guess for the root
    %   N       - # of iterations
    %   tol     - Tolerance for convergence
    
    
    if nargin < 4 || isempty(N)
        N = 15; % Default number of iterations
    end
    if nargin < 5
        tol = 1.0e-9; % Default tolerance
    end
    
    % edited:
    p_sm(1) = x0;
    p_sm(2) = x1;

    for i = 1:N
        % Calculate the function values at the current guesses
        f0 = f(x0);
        f1 = f(x1);
        
        % Avoid division by zero
        if f1 == f0
            error('Division by zero encountered in Secant Method.');
        end
        
        % Secant update formula to find the new approximation
        xNew = x1 - f1 * (x1 - x0) / (f1 - f0);

        p_sm(i+2) = xNew;
        
        % Check for convergence
        if abs(xNew - x1) < tol * max(abs(x1), 1.0)
            root = xNew;
            nits = i;
            return;
        end
        
        % Update the guesses for the next iteration
        x0 = x1;
        x1 = xNew;
    end
    
    error('Secant method exceeded maximum number of iterations.');
end
