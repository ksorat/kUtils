function Embiggen(h,varargin)

if (length(varargin) > 0)
    fontsize = varargin{1};
else
fontsize = 25;%25; %17
end


LW = 2.0; %LW = 4;

set(0,'DefaultLineLineWidth',LW);
set(h,'LineWidth',LW);


set(gca,'FontSize',fontsize);
hx = get(gca,'XLabel');
hy = get(gca,'YLabel');
ht = get(gca,'title');

set(hx,'FontSize',fontsize);
set(hy,'FontSize',fontsize);
set(ht,'FontSize',fontsize);

