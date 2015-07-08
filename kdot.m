function [AdB Alpha] = kdot(varargin)

Nv = length(varargin);

if (Nv == 4)
    Dim = 2;
    Ax = varargin{1}; Ay = varargin{2};
    Bx = varargin{3}; By = varargin{4};
    AdB = Ax.*Bx + Ay.*By;
    [Nx Ny] = size(Ax); Nz = 1;
    Dotdat = zeros(Nx,Ny,Nz); Dotdat(:,:,1) = AdB;
    
    Az = zeros(Nx,Ny,Nz); Bz = zeros(Nx,Ny,Nz);
elseif (Nv == 6)
    Dim = 3;
    Ax = varargin{1}; Ay = varargin{2}; Az = varargin{3};
    Bx = varargin{4}; By = varargin{5}; Bz = varargin{6};
    AdB = Ax.*Bx + Ay.*By + Az.*Bz;
    [Nx Ny Nz] = size(Ax);
    Dotdat = zeros(Nx,Ny,Nz); Dotdat = AdB;
end

Alpha = Dotdat;

for i=1:Nx
    for j=1:Ny
        for k=1:Nz
            if (Dim == 2)
               ax = Ax(i,j); ay = Ay(i,j);
               bx = Bx(i,j); by = By(i,j);
               az = 0; bz = 0;
            else
                ax = Ax(i,j,k); ay = Ay(i,j,k); az = Az(i,j,k);
                bx = Bx(i,j,k); by = By(i,j,k); bz = Bz(i,j,k);
               
            end
            abar = sqrt(ax^2 + ay^2 + az^2);
            bbar = sqrt(bx^2 + by^2 + bz^2);
            Arg = Dotdat(i,j,k)/(abar*bbar);
            Alpha(i,j,k) = acosd(Arg);
        end
    end
end

Alpha = squeeze(Alpha);

