function x = NewtonMethod(F,J,n)
    x = zeros(n,1); % set initial to (0,...,0)
    Iter = 1;
    MaxIter = 100;
    TOL = 1e-5;
    
    while Iter < MaxIter
        disp(['Iter = ' num2str(Iter)]);
        y = J(x)\(-F(x));
        x = x+y;
        if norm(y,2)<TOL 
            break; 
        end
        disp(['x = ' num2str(x')]);
    end
    if Iter >= MaxIter
        disp('Maximum number of iteration exceeded!');
    end
end

% solution for Part 2.
% function F
function y = F(x)
    x1 = x(1);
    x2 = x(2);
    y = zeros(2,1);
    y(1) = x1^2+x2^2-1; % f1(x1,x2)
    y(2) = x2-exp(x1); % f2(x1,x2);
end
% Jacobian matrix of F
function A = J(x)
    x1 = x(1);
    x2 = x(2);
    A = zeros(2,2);
    A(1,1) = 2*x1; % df1x1
    A(1,2) = 2*x2; % df1x2
    A(2,1) = -exp(x1); % df2x1
    A(2,2) = 1; % df2x2;
end
function newtonSol
    x = NewtonMethod(@F,@J,2);
end
