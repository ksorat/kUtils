
function [xi xc dx] = conDimension(x0,x1,Nx);

xi = linspace(x0,x1,Nx+1);

xc = 0.5*(xi(1:end-1)+xi(2:end));
dx = xc(2)-xc(1);

xc = [xc(1)-dx, xc, xc(end)+dx]; %Add ghosts to either end


