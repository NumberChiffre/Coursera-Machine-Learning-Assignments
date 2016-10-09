a = [1 0 0;0 0 1; 0 -1 1];
trans = a'*a;

x0 = 100;

for i=1:10
    if i == 1
        fx = (x0*x0 + 5)/(2*x0);
        newfx = fx;
    else
        fx = (newfx*newfx + 5)/(2*newfx);
        newfx = fx;
    end
    disp(newfx);
end

for j=1:8
    sum = 0;
    for k=1:10^j
        sum = sum + 1/k;
    end
    disp(sum);
end

    
    