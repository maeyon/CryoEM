%���S���ɓY���Ď���L�����߂�v���O����

%filename='F2609_contrast_adjusted.jpg';
%[y, z, filename_new] = myprepare(filemame) %��f�l�̍X�V

z = imread('checkerboard-squares-black-white.jpg');
z(:,1:912,1:3)=127;
z(:,1056:1920,1:3)=127;
filename='cb.png';

%���q�\���ɉ����悤�ɁAfilename_new�̉摜��4�ȏ�̓_�����ƂŃv���b�g
%[y,tc,tr]=myread(filename_new);%�摜��ǂݍ���
tc = [100,200,400,800,1800];
tr = [948+12*rand(1),948-12*rand(1),948+12*rand(1),948-12*rand(1),948+12*rand(1)];

s = myspline_est(tc,tr);%�X�v���C�����
dx = (tc(end)-tc(1))/10000;
Tx = tc(1):dx:tc(end);
Ty = myspline(Tx,s,tc);

dy = diff(Ty);
l = sum(sqrt(dx^2+dy.^2)); %�n�_����I�_�܂ł̋���l�𑪂�
n = floor(l);
e = l/n; %�Ԋu
[mu_x, mu_y] = myplot(Tx, dx, dy, e, s, tc, n); %�Ȑ���ɊԊue���ƂɃv���b�g

g = 5; %�d��
mu_z = mybright(z, mu_x, mu_y, g, n); %�Ȑ���̋P�x�l�̐��� (in:y, mu, g, out:mu)

[B, f] = myfft(mu_z,n,l); %�t�[���G�ϊ�
L = 1/f(B == max(B));
%myfft2()

%�C�ӂ̍��W(x, y)�ɂ�����Ȑ���
%alpha, beta 
%u, v �Ȑ��������ɂȂ�悤�ȐV�������
%[alpha, beta, u, v] = proje2spline(t, a, x, y);