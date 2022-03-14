function diffVloc(dim)

% Establish random standard deviations
sig = 140;
% Establish x-y plane
xs = -dim:dim; %dim+1 values
ys = xs;

% Turn into meshgrid
[X,Y] = meshgrid(xs,ys);
% Adjustable normalization
norm =20/(sqrt(2*pi));

% Get z values
zvals=norm*exp(-((X.^2)/2+(Y.^2)/2)/(2*sig.^2));

% 
std = 1;
scale = 4;
scl = 3;
r = linspace(0,scl*2*pi,dim) ;
th = linspace(0,2*pi,dim) ;
[R,T] = meshgrid(r,th) ;
XX = R.*sin(T) ;
YY = R.*cos(T) ;
eps = 1e-1;
R(R>1/eps) = eps;
Z =(-R+2*pi);
Z = scale*(Z +1);
Z = exp((Z.*0.1)./std);
Z(Z<0)=0;
minz  = min(min(Z));
Z = Z-abs(minz);
pX = linspace(-2*pi,2*pi,dim);
pY = pX;
[pXX,pYY] = meshgrid(pX,pY);
min(min(Z))
surf(pXX,pYY,eps*(ones(size(XX,1),size(XX,2))),'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5);
hold on
surf(XX,YY,Z,'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5)
%surf(pXX,pYY,(zeros(size(XX,1),size(XX,2))),'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5);
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

% % Plotting sequence
% std = 1;
% scale = 4;
% scl = 2
% r = linspace(0,scl*2*pi,dim) ;
% th = linspace(0,scl*2*pi,dim) ;
% [R,T] = meshgrid(r,th);
% XX = [R(1:dim/scl,1:dim/scl).*sin(T(1:dim/scl,1:dim/scl)) R(dim/scl+1:end,dim/scl+1:end)];
% XX =[XX;XX]
% YY = [R(1:dim/scl,1:dim/scl).*cos(T(1:dim/scl,1:dim/scl)) R(dim/scl+1:end,dim/scl+1:end)];
% YY =[YY;YY]
% eps = 1e-4;
% R(R>1/eps) = eps;

