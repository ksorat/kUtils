function zs = TwoSmoothOld(z,xs,ys)

[Nx Ny] = size(z);
zs = zeros(Nx,Ny);

xs2 = floor(xs/2);
ys2 = floor(ys/2);
for i=1:Nx
    for j=1:Ny
        i1 = max(i-xs2,1);
        i2 = min(i+xs2,Nx);
        j1 = max(j-ys2,1);
        j2 = min(j+ys2,Ny);
        
        zs(i,j) = AllMean(z(i1:i2,j1:j2));
    end
end