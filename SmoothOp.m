function Xs = SmoothOp(X,Ns)

N = length(X);
Ns2 = floor(Ns/2);
Xs = X;
for i=1:N
    i1 = max(i-Ns2,1);
    i2 = min(i+Ns2,N);
    Xs(i) = mean(X(i1:i2));

end

%Xs = X;
