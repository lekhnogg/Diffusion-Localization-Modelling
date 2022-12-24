function diffVloc(dim)

% Diffusive Model (Follows a 3D Gaussian)
 

% Establish x-y plane
xs = -dim:dim; %dim+1 values
ys = xs;

% Turn into meshgrid
[X,Y] = meshgrid(xs,ys);

% Establish sigma value
sig = 5;

% Adjustable normalization
norm =20/(sqrt(2*pi));

% Get diffusive z values
zvals=norm*exp(-((X.^2)/2+(Y.^2)/2)/(2*sig.^2));

% Quasi-Gabriel's Horn/Tear drop 

% Z value scale (how high the peak will be)
zscale = 5;

% Base of figure scale (how wide the base will be)
bscale = 3;

% Get radius values
r = linspace(0,bscale*2*pi,dim);

% Get theta values
th = linspace(0,2*pi,dim);

% Establish meshgrid in terms of radius and angle theta
[R,T] = meshgrid(r,th);

% Get x,y values in polar coordinates
YY = R.*sin(T);
XX = R.*cos(T);

% Flip concavity and adjust height using zscale
Z = zscale*(-R+zscale);

% Acquire localized z values
Z = exp(Z.*0.1);

% Base 2D platform (if desired)
pX = linspace(-2*pi,2*pi,dim);
pY = pX;
[pXX,pYY] = meshgrid(pX,pY);
surf(pXX,pYY,0.01*(ones(size(XX,1),size(XX,2))),'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5);
hold on

% Localized Plot
surf(XX,YY,Z,'EdgeColor','none','FaceLighting','phong','FaceColor','interp','AmbientStrength',0.5)
dr = 2*pi;
axis([-dr dr -dr dr 0 50])
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
