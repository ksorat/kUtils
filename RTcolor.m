function h = RTcolor(r,th,Z,varargin)

%Reorient if necessary
S = size(Z);
if (S(1) == length(r)) & (S(2) == length(th))
    Z = Z';
end

%Upsample if necessary
if (length(varargin) > 0)
    N = varargin{1};
    [r th Z] = UpSample(r,th,Z,N); 
end
Nr = length(r);
Nth = length(th);
X = zeros(Nr,Nth); Y = zeros(Nr,Nth);


for i=1:Nr
    for j=1:Nth
        X(i,j) = r(i)*sin(th(j));
        Y(i,j) = r(i)*cos(th(j));
    end
end

%Reorient final matrix if necessary
S = size(Z);
if (S(1) == Nth) & (S(2) == Nr)
   Z = Z'; 
end



h = kcolor(X,Y,Z);
