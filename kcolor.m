function h = kcolor(x,y,z,varargin)

Nx = length(x); Ny = length(y);
S = size(z);
%Expect S = [Ny,Nx]

if (S(1) == Nx) & (S(2) == Ny & (Nx ~= Ny))
   z = z'; 
end


if (length(varargin) > 0)
    N = varargin{1};
    if N>1
        [x y z] = UpSample(x,y,z,N);
    end
end

h = pcolor(x,y,z);
shading flat; colorbar()
Embiggen(h);
