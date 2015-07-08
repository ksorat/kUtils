function X = ConVars(Sv,VarS,varargin)

if length(varargin) > 0
   X = varargin{1};  
end

Sub = 'X.';
if length(varargin) > 1
    Sub = sprintf('X.%s.',varargin{2});
    
end

Nvar = length(VarS);

for i=1:Nvar
   Var = VarS{i};
   ComS = sprintf('%s%s = zeros(Sv);',Sub,Var);
   eval(ComS);
end