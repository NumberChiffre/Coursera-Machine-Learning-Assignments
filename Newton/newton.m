function [x,iter] = newtonm(x0,f,J)
    % Newton-Raphson method applied to a
    % system of linear equations f(x) = 0,
    % given the jacobian function J, with
    % J = del(f1,f2,...,fn)/del(x1,x2,...,xn)
    % x = [x1;x2;...;xn], f = [f1;f2;...;fn]
    % x0 is an initial guess of the solution
    N = 100; % define max. number of iterations
    epsilon = 1e-14; % define tolerance
    maxval = 10000.0; % define value for divergence
    xx = x0; % load initial guess
    while (N>0)
        JJ = feval(J,xx);
        if abs(det(JJ))<epsilon
            error('newtonm - Jacobian is singular - try new x0');
            abort;
        end;
        xn = xx - inv(JJ)*feval(f,xx); 
        if abs(feval(f,xn))<epsilon
            x=xn;
            iter = 100-N;
            return;
        end;
        if abs(feval(f,xx))>maxval
            iter = 100-N;
            disp(['iterations = ',num2str(iter)]);
            error('Solution diverges');
            abort;
        end;
        disp(xx);
        N = N - 1;
        xx = xn;
    end;
    error('No convergence after 100 iterations.');
    abort;
% end function
end

function [f] = f2(x)
    % f2(x) = 0, with x = [x(1);x(2)]
    % represents a system of 2 non-linear equations
    f1 = x(1)^2 + x(2)^2 + x(3)^2 - 1;
    f2 = x(3) - exp(x(1));
    f3 = x(3) - exp(x(2));
    f = [f1;f2;f3];
    % end function
end

function [J] = jacob2x2(x)
    % Evaluates the Jacobian of a 2x2
    % system of non-linear equations
    J(1,1) = 2*x(1); J(1,2) = 2*x(2); J(1,3) = 2*x(3);
    J(2,1) = -exp(x(1)); J(2,2) = 0; J(2,3) = 1;
    J(3,1) = 0; J(3,2) = -exp(x(2)); J(3,3) = 1;
    % end function
end

