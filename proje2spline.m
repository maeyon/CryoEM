%�Ȑ�(t, a)�Ɗi�q�_(x', y')����͂���ƁA�i�q����Ȑ��ɑ΂��ĉ����������̌�_(alpha,
%beta)�Ǝn�_�����_�܂ł̋Ȑ��ɉ���������u, �i�q�_�ƌ�_�̋���v��Ԃ��֐�
function [alpha, beta, u, v] = proje2spline(t, s, x', y')

%�n�_�ƏI�_�����Ԓ���������
A = [tc(1) 1 ; tc(N+1) 1];
B = [tr(1) ; t(N+1)];
C = inv(A) * B;

%�C�ӂ̊i�q�_(x, y)��ʂ�A��ŋ��߂������ɐ����Ȓ��������߂�
D = y + C(1) * x;

%�����ƃX�v���C���Ȑ��̌�_�����߂�
syms x
for i = 0 : N
    solve(a(i)*x^3 + b(i)*x^2 + c(i)*x + d(i) - C(1) * x - D, x);
        if x >= x(i) && x <= x(i+1)
            break
        end
end

%�i�q�_(x, y)�ƃX�v���C���Ȑ��̋����̊֐������߂�


%(alpha, beta)�̏����l�����܂����̂ŁA�j���[�g���@��3��J��Ԃ��A(alpha, beta)���X�V


%���̊i�q�_��(u, v)���W�ŕ\��
u = sum 