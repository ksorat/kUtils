
%Takes the values to be used in a psuedo-plot and upsamples using
%interpolation

function [xu yu zu] = UpSample(x,y,z,N)

Nx = length(x);
Ny = length(y);

[XX YY] = meshgrid(x,y);

xu = linspace(x(1),x(end),Nx*N);
yu = linspace(y(1),y(end),Ny*N);
[XXu YYu] = meshgrid(xu,yu);

zu = griddata(XX,YY,z,XXu,YYu);


