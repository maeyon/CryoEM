z = (1:1200);
R = 30;%���S�~�̔��a
r = (0:R);%�������q�̔��a
T = max(z)/12;%���S�̎���
t = 3*T/4;%�P�x�l�̎���
X = R*cos(2*pi*z/T);%���S��x���W
Y = R*sin(2*pi*z/T);%���S��y���W
theta = (0:0.01:2*pi);%
x_1 = r*cos(theta) + X;%
y_1 = r*sin(theta) + Y;%
x_2 = r*cos(theta) + X;%
y_2 = r*sin(theta) + Y;%
f = 64;
f_1 = f*(cos(2*pi*z/t)+3/2);%����1�̋P�x�l
f_2 = f*(sin(2*pi*z/t)+3/2);%����2�̋P�x�l
f_B = f*ones(100,100,1200);%�w�i�̋P�x�l

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