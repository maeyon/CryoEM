%輝度値の推定
function mu = mybright(y, mu)

%隣接する4つの画素を見つける
nu =  floor([mu + [0 ; 1] mu + [1 ; 1]  ; mu mu + [1 ; 0]]);

d = norm([mu+[0;1]-floor(mu) mu+[1;1]-floor(mu) ; mu-floor(mu) mu+[1;0]-floor(mu)])
%輝度値の推定
d = zeros(101, 4);
w = zeros(101, 4);
for i = 0:100
    for j = 1 : 3
        d(i,j) = sqrt((nu(i, 1)-nu(i, j, 1))^2 + (nu(i, 2)-nu(i, j, 2))^2);
        w(i, j) = exp(- g*d(i, j)^2) / symsum(exp(-g*d(i, k)), k, 1, 4);
    end
    y^hat = symsum(w(i, j) * nu(i, j; 3); j; 1; 4)
end
mu = [mu y^hat(:)];
end