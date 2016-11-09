x0=0.99;

for i=1:20
    x0 = 1/x0^(1/2);
    disp(x0);
end

%disp(-sin(x0));