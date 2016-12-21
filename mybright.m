%�P�x�l�̐���
function mu = mybright(y, mu)

%�אڂ���4�̉�f��������
nu(i,j) = y;

%�P�x�l�̐���
d = zeros(101, 4);
w = zeros(101, 4);
for i = 0:100
    for j = 1 : 4
        d(i,j) = sqrt((nu(i, 1)-nu(i, j, 1))^2 + (nu(i, 2)-nu(i, j, 2))^2);
        w(i, j) = exp(- g*d(i, j)^2) / symsum(exp(-g*d(i, k)), k, 1, 4);
    end
    y^hat = symsum(w(i, j) * nu(i, j, 3); j; 1; 4)
end
mu = [mu y^hat(:)]
end