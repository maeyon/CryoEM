%�Ȑ�(t, a)�Ɗi�q�_(x', y')����͂���ƁA�i�q����Ȑ��ɑ΂��ĉ����������̌�_(alpha,
%beta)�Ǝn�_�����_�܂ł̋Ȑ��ɉ���������u, �i�q�_�ƌ�_�̋���v��Ԃ��֐�
function [alpha, beta, u, v] = proje2spline(t, s, x', y')


%�n�_����̋Ȑ���̋�����s��ϕ��ŋ��߂�
syms T(:, 1)
u = int(sqrt(1 + diff(T(:, 2), T(:, 1))^2));
l = 