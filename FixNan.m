function Xf = FixNan(X)

Xf = X;
Xf(isnan(X)) = 0;
