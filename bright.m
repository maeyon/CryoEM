%輝度値の推定
%隣接する4つの画素を見つける
nu(i,j)

%輝度値の推定
g = 500;
d = zeros(101, 4);
w = zeros(101, 4);
for i = 0:100
    for j = 1 : 4
        d(i,j) = norm(mu(i) - nu(i,j));
        w(i, j) = exp(- g*d(i, j)^2) / symsum(exp(-g*d(i, k)), k, 1, 4);
    end
    b(i) = symsum(w(i, j) * 輝度値(j); j; 1; 4)
end