
function zs = TwoSmooth(z,radx,rady)

[Nx Ny] = size(z);
zs = z;

radx = round(radx); rady = round(rady);

xInt = radx+1:Nx-radx;
yInt = rady+1:Ny-rady;

delxs = -radx:radx;
delys = -rady:rady;

accum = 0;
for i=1:length(delxs)
    for j=1:length(delys)
        delx = delxs(i);
        dely = delys(j);
        accum = accum + z(xInt+delx,yInt+dely);
    end
end
Num = (2*radx+1)*(2*rady+1);
zs(xInt,yInt) = accum/Num;
