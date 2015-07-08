%Takes as input F(x,y,z) and downsamples by factor N

function [xd yd zd Fd] = DownSample3(x,y,z,F,N)

Nx = length(x); Ny = length(y); Nz = length(z);

xd = x(1:N:Nx);
yd = y(1:N:Ny);
zd = z(1:N:Nz);

Fd = F(1:N:Nx,1:N:Ny,1:N:Nz);
