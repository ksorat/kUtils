function [ax ay az] = ColumnNorm(Ax,Ay,Az)

Nx = length(Ax);
ax = Ax;
ay = ax; az = ax;

for i=1:Nx
   Axi = Ax(i); Ayi = Ay(i); Azi = Az(i);
   Anorm = norm([Axi Ayi Azi]);
   ax(i) = Axi/Anorm;
   ay(i) = Ayi/Anorm;
   az(i) = Azi/Anorm;
   
end