%���S���ɓY���Ď���L�����߂�v���O����

%����
    %�ϑ��摜�X�v���C����Ԃ̓񎟌����W(�ϑ��摜��̉�f�C���f�b�N�X)��N�_ (2xN)�̍s��
    %�X�v���C���Ȑ���ɂƂ�_�̊Ԋu e��
    %(21)�̕�Ԃ̏d�݃�
    %�X�v���C���Ȑ���ɂƂ�_�̎n�_S)

%�o�́F�n�_S ����Ԋue ���ƂɂƂ����X�v���C���Ȑ���̕�Ԃ����u��f�l�̗�v�Ƃ��́u�ʒu���W�v

filename='F2609_contrast_adjusted.jpg';

%�摜��ǂݍ��� (in: �摜, out: y, t)
%y = (x, y, �P�x�l)
%t = (x, y)
[y, t]=myread(filename);

%�X�v���C����� (in: t, out:T)
%T = (x, y)
myspline(t);

%�Ȑ���ɊԊue���ƂɃv���b�g (in:T, out:mu)
%mu = (x, y, �P�x�l=0)
myplot(T);

%�Ȑ���̋P�x�l�̐��� (in:y, mu, out:mu)
%mu = (x, y, �P�x�l)
mybright(y, mu);

%�t�[���G�ϊ�
L = fft(mu);