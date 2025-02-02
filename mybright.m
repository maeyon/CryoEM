%輝度値の推定
function mu = mybright(z, mu_x, mu_y, g, n)

%隣接する4つの画素を見つける
nu_x = floor([mu_x+1 ; mu_x ; mu_x ; mu_x+1]);
nu_y = floor([mu_y+1 ; mu_y+1 ; mu_y ; mu_y]);
 
%輝度値の推定
d = (repmat(mu_x,4,1) - nu_x).^2 + (repmat(mu_y,4,1) - nu_y).^2;
sigma = exp(-g*d);
denom = sum(sigma);
omega = sigma ./ repmat(denom, 4, 1);
Ind = sub2ind(size(z), nu_x(:), nu_y(:));
mu_z = sum(omega .*reshape(double(z(Ind)),4, n));
mu = [mu_x mu_y mu_z];
end