function M = OneMov(Dat,Prop)

fig1 = figure(1);
set(gcf, 'Position', get(0,'Screensize'));
winsize = get(fig1,'Position');
winsize(1:2) = [0 0];
set(fig1,'NextPlot','replacechildren');


Col = {'r','b','g','c','m'};

N=1;
[Nf,Nt,Nx] = size(Dat);


if isfield(Prop,'frames')
    Numframe = Prop.frames;
else
    Numframe = 1;
end

for i=1:Nt
    for k=1:Numframe
        for j=1:Nf
            plot(Prop.x,squeeze(Dat(j,i,:)),Col{j}); hold on;
        end
        legend('dtheta','Stress (rp)','Stress (rz)');
        hold off;
        if isfield(Prop,'titS')
            TitS = sprintf('%s %2.2f', Prop.titS,Prop.tit(i));
            title(TitS);
        end
        
        if isfield(Prop,'xlab') xlabel(Prop.xlab); end
        if isfield(Prop,'ylab') ylabel(Prop.ylab); end
        if isfield(Prop,'ax') axis(Prop.ax); end
        
        
        
        M(N) = getframe(fig1,winsize);
        N=N+1;
    end
end

if isfield(Prop,'Filename')
   mpgwrite(M,jet,Prop.Filename);
end