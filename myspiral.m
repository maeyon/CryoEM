%creation_of_spiral_image
%% Assumption
x=-60:60;y=-60:60;z=0:360;%Cartesian coordinates
Lx = length(x);
Ly = length(y);
Lz = length(z);

omega=zeros(Lx, Ly);rho=zeros(Lx, Ly);
[X,Y] = meshgrid(x,y)
omega = atan(Y./X);
rho=sqrt(X.^2+Y.^2);

%% create 3D volume image
l=20;m=10;%sample point(need to be over 4)
mu=max(x)/(2*(2*m-1));%mean
c=0;%constant
sigma=mu/2;%variance
theta=ones(l,m,2)/m;%weight
dz=1;domega=3;
V = my3D(x, y, z, dz, rho, omega, domega, theta, mu, c, sigma, m, l);
%% Maximum Intensity Projection
V_mip = mymip(V);
%% Projection
I_P = myproj(V);
%% Curve Helix
y_1=-100;y_2=200;
I_C = create_curve_helix(I_P, y_1, y_2);
%% Point Spread Function
sigma=10;%standard deviation
I_PSF = myPSF(I_C, sigma);
%% Equation of Plains & Estimation of Brightness
I_D=mydiscrete(I_C);
