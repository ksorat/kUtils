function h = kplot(x,y,varargin)
%Decide if x/y are vectors or cells

if (iscell(y))
    Y = y;
    N = length(Y);
else
    Y{1} = y;
    N = 1;
end

if (iscell(x)) 
    X = x;
else
    for i=1:N
       X{i} = x; 
    end
end

if (length(varargin) > 0)
    Param = varargin{1};
else
    Param.gibberish = 0;
end

if ~isfield(Param,'Xlab')
    Param.Xlab = 'X label';
end

if ~isfield(Param,'Ylab')
    Param.Ylab = 'Y label';
end

if ~isfield(Param,'TitS')
    Param.TitS = '';
end

if ~isfield(Param,'Pl')
   Pl = {'r','b','g','k','m','c'};
else
    Pl = Param.Pl;
end

if ~isfield(Param,'type')
   Param.type = 'plot'; 
end

PlotS = sprintf('h = %s(X{1},Y{1},Pl{1}',Param.type);

for i=2:N
   PlotS = sprintf('%s ,X{%d},Y{%d},Pl{%d}',PlotS,i,i,i); 
end
PlotS = sprintf('%s);',PlotS);

eval(PlotS);
xlabel(Param.Xlab); ylabel(Param.Ylab); title(Param.TitS);
if isfield(Param,'Leg')
    if isfield(Param,'LegLoc')
        legend(Param.Leg,'Location',Param.LegLoc);
    else
        legend(Param.Leg);
    end
end
if isfield(Param,'Ax')
    axis(Param.Ax);
end
if isfield(Param,'fs');
    Embiggen(h,Param.fs);
else
    Embiggen(h);
end


