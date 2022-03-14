function RandPotEneLevels(dim,numPeaks)

% r = a + (b-a) .* rand(N,1) --> random int between a and b
% Initiate empty matrix for Z values
zvals = zeros(2*dim+1,2*dim+1);
% Establish random standard deviations
sig = 0.03*dim +(0.05*dim-0.03*dim).*rand(numPeaks,1);
% Establish random unique offsets for gaussian in both x and y dir
midx = (-dim+0.3*dim) +((dim-0.3*dim)-(-dim+0.3*dim)).*rand(numPeaks,1);
midy = (-dim+0.3*dim) +((dim-0.3*dim)-(-dim+0.3*dim)).*rand(numPeaks,1);
% Create base to plot over
xs = -dim:dim; %dim+1 values
ys = xs;
% Turn into meshgrid
[X,Y] = meshgrid(xs,ys);
% Adjustable normalization
norm = 200/(sqrt(2*pi));
% Initiate forloop over amount of desired supersitions of gaussians
for i = 1:(numPeaks)
    zvals =zvals +  norm*exp(-(((X-midx(i)).^2)/2+((Y-midy(i)).^2)/2)/(2*sig(i).^2));
end
% Establishing estimated values for planes indicating energy regimes
maxEval = max(max(zvals)) + 0.1*dim;
midEval = 0.1*maxEval + maxEval/2;
minEval = min(min(zvals)) + 0.1*dim;
% Plotting sequence
ss = surf(X,Y,zvals,'EdgeColor','none','FaceLighting','gouraud');
Ax = gca;
Ax.ZAxis.Visible = 'off';
Ax.XAxis.Visible = 'off';
Ax.YAxis.Visible = 'off';
Ax.Color = 'none';
%set(gca,'Color','w');
camlight;
hold on
% Plotting planes
plot3(X,Y,(maxEval*ones(size(X,1),size(X,2))),'Color','y','LineStyle',':');
plot3(X,Y,(midEval*ones(size(X,1),size(X,2))),'Color','[0.4660 0.6740 0.1880]','LineStyle',':');
plot3(X,Y,(minEval*ones(size(X,1),size(X,2))),'Color','[0 0.4470 0.7410]','LineStyle',':');

