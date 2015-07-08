function BigFont(h,varargin)

if (length(varargin) > 0)
    fontsize = varargin{1};
else
    fontsize = 15;
end

set(gca,'FontSize',fontsize);
hx = get(gca,'XLabel');
hy = get(gca,'YLabel');
ht = get(gca,'title');

set(hx,'FontSize',fontsize);
set(hy,'FontSize',fontsize);
set(ht,'FontSize',fontsize);