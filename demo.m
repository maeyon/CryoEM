%���S���ɓY���Ď���L�����߂�v���O����

%����
    %�ϑ��摜�X�v���C����Ԃ̓񎟌����W(�ϑ��摜��̉�f�C���f�b�N�X)��N�_ (2xN)�̍s��
    %�X�v���C���Ȑ���ɂƂ�_�̊Ԋu e��
    %(21)�̕�Ԃ̏d�݃�
    %�X�v���C���Ȑ���ɂƂ�_�̎n�_S)

%�o�́F�n�_S ����Ԋue ���ƂɂƂ����X�v���C���Ȑ���̕�Ԃ����u��f�l�̗�v�Ƃ��́u�ʒu���W�v

z=imread('F2609_contrast_adjusted.jpg');
filename='F2609_contrast_adjusted_update.jpg';

%�摜��ǂݍ��� (in: �摜, out: y, t)
%y = (x, y, �P�x�l)
%t = (x, y)
[y,tc,tr]=myread(filename);

%�X�v���C����� (in: t, out:t)
%t = (a, b, c, d)
s = myspline_est(tc,tr);
Tx = tc(1):(tc(end)-tc(1))/10000:tc(end);
Ty = myspline(Tx,s,tc);

%�Ȑ���ɊԊue���ƂɃv���b�g (in:T, out:mu)
%mu = (x, y, �P�x�l=0)
%n:�C�ӂ̐����B������ϐ��ɂ���e�̑傫����ς���

%�n�_����I�_�܂ł̋���l�𑪂�
l = sum(sqrt(1+diff(Ty).^2));

%�Ԋue�����߂�
n = 100;
e = l / n;

[mu_x, mu_y] = myplot(Tx,Ty,e, s, tc);

%�Ȑ���̋P�x�l�̐��� (in:y, mu, g, out:mu)
%mu = (x, y, �P�x�l)
g = 5;
mu = mybright(z, mu_x, mu_y, g, n);

%�t�[���G�ϊ�
%q = [0, cumsum(sqrt(1+(diff(mu_y)./diff(mu_x)).^2))];
mu_z = mu(:,3);
L = fft(mu_z);
%�C�ӂ̍��W(x, y)�ɂ�����Ȑ���
%alpha, beta 
%u, v �Ȑ��������ɂȂ�悤�ȐV�������
%[alpha, beta, u, v] = proje2spline(t, a, x, y);