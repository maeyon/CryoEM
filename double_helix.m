z = (1:1200);
R = 30;%中心円の半径
r = (0:R);%螺旋分子の半径
T = max(z)/12;%中心の周期
t = 3*T/4;%輝度値の周期
X = R*cos(2*pi*z/T);%中心のx座標
Y = R*sin(2*pi*z/T);%中心のy座標
theta = (0:0.01:2*pi);%
x_1 = r*cos(theta) + X;%
y_1 = r*sin(theta) + Y;%
x_2 = r*cos(theta) + X;%
y_2 = r*sin(theta) + Y;%
f = 64;
f_1 = f*(cos(2*pi*z/t)+3/2);%螺旋1の輝度値
f_2 = f*(sin(2*pi*z/t)+3/2);%螺旋2の輝度値
f_B = f*ones(100,100,1200);%背景の輝度値

mu = [0 0];
a = sqrt(200);
Sigma = [a 0; 0 a];
x1 = -20:.5:20; x2 = -20:.5:20;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-100 100 -100 100 0 1200])
xlabel('x'); ylabel('y'); zlabel('z');