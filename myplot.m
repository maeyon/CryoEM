%�Ԋue���Ƃ̃v���b�g
function mu = myplot(T, y)

%�n�_����̋Ȑ���̋�����s��ϕ��ŋ��߂�
syms T(:, 1)
u = int(sqrt(1 + diff(T(:, 2), T(:, 1))^2));

%e�̊Ԋu�����߂�
e = l / 100;

%�Ԋue���ƂɃv���b�g
mu = zeros(101, 3);
for i = 0:100
    for j = 0:100
        for k = 0:10000
            if u(k) == j*e
                mu(i) = T(k, :);
            end
        end
    end
end
end