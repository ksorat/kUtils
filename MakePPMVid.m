function MakePPMVid(x,y,z,t,Param)

[Nx Ny Nt] = size(z);

if isfield(Param,'xlab')
    Xlab = Param.xlab;
else
    Xlab = 'X axis';
end

if isfield(Param,'ylab')
    Ylab = Param.ylab;
else
    Ylab = 'Y axis';
end

if isfield(Param,'Outdir')
    Outdir = Param.Outdir;
else
    Outdir = 'Out';
end
if isfield(Param,'Upfac')
    Upfac = Param.Upfac;
else
    Upfac = 1;
end

if isfield(Param,'Picstub')
    Picstub = Param.Picstub;
else
    Picstub = 'Out';
end
C = Param.C;
Ax = Param.Ax;

mkdir(Outdir);

for i=1:Nt
    h = kcolor(x,y,squeeze(z(:,:,i)),Upfac); caxis(C); axis(Ax);
    xlabel(Xlab); ylabel(Ylab);
    TitS = sprintf('Orbit %2.2f',t(i));
    title(TitS);
    Embiggen(h,11);
    Fileout = sprintf('%s/%s.%04d.ppm',Outdir,Picstub,i);
    saveas(gcf,Fileout,'ppm');
    %set(gcf,'Position',get(0,'Screensize'));
    
end

