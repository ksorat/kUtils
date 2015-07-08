%Constructs an interpolant to the spherical function F(r,theta,phi)
%This involves translating to cartesian coordinates

function Fint = ConInterpSph(r,theta,phi,F)

[r theta phi F] = DownSample3(r,theta,phi,F,2);

%given r,theta,phi are vectors convert to matrices

[TT RR PP] = meshgrid(theta,r,phi); %Order is funny because of function

[X,Y,Z] = sph2cart(PP,pi/2-TT,RR); %sph2cart function uses mathematical notation and elevation


%Convert to column vectors

x = X(:);
y = Y(:);
z = Z(:);

Fcol = F(:);

Fint = TriScatteredInterp(x,y,z,Fcol);
