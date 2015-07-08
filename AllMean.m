function mz = AllMean(Z)

N = ndims(Z);
mz = mean(Z);
for i=1:N-1
   mz = mean(mz);
end