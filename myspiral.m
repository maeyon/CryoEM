%creation_of_spiral_image
%% Assumption
x=0:120;y=0:120;z=0:360;%Cartesian coordinates
omega=zeros(length(x), length(y));rho=zeros(length(x), length(y));
for i=1:length(x)
    for j=1:length(y)
        omega(i,j)=atan((y(j)-max(y)/2)/(x(i)-max(x)/2));%Angular coordinate
        rho(i,j)=sqrt((x(i)-max(x)/2).^2+(y(j)-max(y)/2).^2); %Radial coordinate
    end
end
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