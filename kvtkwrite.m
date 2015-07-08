
%Writes vtk file (rectiliner grid / cell data)
function kvtkwrite(filename,xi,yi,zi,Uxyz,varname,t,cyc)

Nxi = length(xi);
Nyi = length(yi);
Nzi = length(zi);

N = (Nxi-1)*(Nyi-1)*(Nzi-1);

fid = fopen(filename, 'w'); 
% VTK files contain five major parts
% 1. VTK DataFile Version
fprintf(fid, '# vtk DataFile Version 2.0\n');
% 2. Title
fprintf(fid, 'VTK from Matlab\n');
% 3. Data type (Binary | ASCII)
fprintf(fid, 'BINARY\n');
% 4. Type of grid
fprintf(fid, 'DATASET RECTILINEAR_GRID\n');
fprintf(fid, 'FIELD FieldData 1\n');
fprintf(fid, 'TIME 1 1 float\n');
fwrite(fid, t, 'float','b');
fprintf(fid,'\n');
%fprintf(fid, 'CYCLE 1 1 int\n');
%fwrite(fid, cyc, 'int','b');
%fprintf(fid,'\n');

fprintf(fid, 'DIMENSIONS %d %d %d\n', Nxi, Nyi, Nzi);
fprintf(fid, 'X_COORDINATES %d float\n', Nxi);
fwrite(fid, xi(:), 'float','b');
fprintf(fid, '\nY_COORDINATES %d float\n', Nyi);
fwrite(fid, yi(:), 'float','b');
fprintf(fid, '\nZ_COORDINATES %d float\n', Nzi);
fwrite(fid, zi(:), 'float','b');

%5. Type of data set
fprintf(fid, '\nCELL_DATA %d\n', N);
fprintf(fid, 'SCALARS %s float\n', varname);
fprintf(fid, 'LOOKUP_TABLE default\n');
fwrite(fid, Uxyz(:),'float','b');

fclose(fid);
