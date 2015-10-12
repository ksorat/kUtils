
%Calculates the approximate identity defined by a/sig at the values x
%Disc = true, square wave
%Disc = false, c^inf mollifier

function y = approxId(x,a,Sig,Disc)

xp = (x-a)/Sig;

y = zeros(size(x));


Ind = abs(xp) < 1;
Arg = -1./( 1 - xp.^2);

if (Disc)
    y(Ind) = 1;
else
    y(Ind) = exp(1)*exp(Arg(Ind));
end

