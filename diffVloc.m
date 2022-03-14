function diffVloc(dim)

% Diffusive Model (Follows a 3D Gaussian)

% Establish sigma value
sig = 140;
% Establish x-y plane
xs = -dim:dim; %dim+1 values
ys = xs;
% Turn into meshgrid
[X,Y] = meshgrid(xs,ys);
% Adjustable normalization
norm =20/(sqrt(2*pi));
% Get diffusive z values
zvals=norm*exp(-((X.^2)/2+(Y.^2)/2)/(2*sig.^2));

% Actual quasi-Gabriel's Horn/upsidedown tear drop/3d Sharp-peak gaussian shape

% Standard deviation
std = 1;
% Z value scale (how high the peak will be)
zscale = 4;
% Base of figure scale (how wide the base will be)
bscale = 3;
% Get radius values
r = linspace(0,bscale*2*pi,dim) ;
% Get theta values
th = linspace(0,2*pi,dim) ;
% Establish meshgrid in terms of radius and angle theta
[R,T] = meshgrid(r,th) ;
% Get x,y values in polar coordinates
XX = R.*sin(T) ;
YY = R.*cos(T) ;
% Establish a cut off value
eps = 1e-2;
% Adjust R values 
R(R>1/eps) = eps;
Z =(-R+2*pi);
% Modulate the z values to achieve desired height
Z = zscale*(Z +1);
% Acquire localized z values
Z = exp((Z.*0.1)./std);
Z(Z<0)=0;

% Eliminate vertical offset
minz = min(min(Z));
Z = Z-abs(minz);

% Base 2D platform (if desired)
pX = linspace(-2*pi,2*pi,dim);
pY = pX;
[pXX,pYY] = meshgrid(pX,pY);
min(min(Z))
surf(pXX,pYY,eps*(ones(size(XX,1),size(XX,2))),'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5);
hold on

% Localized Plot
surf(XX,YY,Z,'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5)
dr = 2*pi;
axis([-dr dr -dr dr 0 50])
%axis([-1.5*pi 1.5*pi -1.5*pi 1.5*pi 0 50])
Ax = gca;
Ax.ZAxis.Visible = 'off'; 
Ax.XAxis.Visible = 'off';
Ax.YAxis.Visible = 'off';
Ax.ZGrid = 'off';
Ax.XGrid = 'off';
Ax.YGrid = 'off';
%set(gca,'Color','b');
Ax.Color = 'none';
view(Ax,[135 31])
colormap 'cool'
light('Position',[0 1 0],'Style','infinite');
%camlight('left');


% Diffusive
figure,surf(X,Y,zvals,'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5);
%axis([-dr dr -dr dr 0 5000])
axis([-dim dim -dim dim 0 50])
Ax = gca;
Ax.ZAxis.Visible = 'off'; 
Ax.XAxis.Visible = 'off';
Ax.YAxis.Visible = 'off';
Ax.ZGrid = 'off';
Ax.XGrid = 'off';
Ax.YGrid = 'off';
%set(gca,'Color','w');
Ax.Color = 'none';
view(Ax,[135 31])
colormap 'cool'
light('Position',[0 1 0],'Style','infinite');
%camlight('left');
hold on



