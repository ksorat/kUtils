function sumz = AllSum(Z)

N = ndims(Z);
sumz = sum(Z);
for i=1:N-1
   sumz = sum(sumz);
end
