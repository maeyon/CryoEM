function [mu_z,w] = mybright(z,mu_x,mu_y,u,v,g,n) %[mu_z, w] = mybright(z, mu_x, mu_y, u, v, g, n) %輝度値の推定

%隣接する4つの画素を見つける
nu_x = floor([mu_x+1 ; mu_x ; mu_x ; mu_x+1]);
nu_y = floor([mu_y+1 ; mu_y+1 ; mu_y ; mu_y]);

%輝度値の推定
d = (repmat(mu_x,4,1) - nu_x).^2 + (repmat(mu_y,4,1) - nu_y).^2;%muを4*n行列にして隣接サイトとの距離を計算
sigma = exp(-g*d);
denom = sum(sigma);
omega = sigma ./ repmat(denom, 4, 1);
Ind = sub2ind(size(z), nu_x(:), nu_y(:));%nuの添字から線形インデックスへの変換
mu_z = sum(omega.*reshape(double(z(Ind)),4,n));

for i=1:length(u)
    ju_x(:,:,i)=floor([u(:,i)+1;u(:,i);u(:,i);u(:,i)+1]);
    ju_y(:,:,i)=floor([v(:,i)+1;v(:,i)+1;v(:,i);v(:,i)]);
end
    nu_x_2=permute(reshape(ju_x,length(u(:,1)),4,length(u)),[2,1,3]);%reshape(ju_x,length(u(:,1)), 4)';
    nu_y_2=permute(reshape(ju_y,length(u(:,1)),4,length(u)),[2,1,3]);%reshape(ju_y,length(u(:,1)), 4)';
    d_2 = ((permute(repmat(u,1,1,4),[3,1,2])) - nu_x_2).^2+((permute(repmat(v,1,1,4),[3,1,2])) - nu_y_2).^2;%(repmat(u(:,i),1,4)' - nu_x_2).^2 + (repmat(v(:,i),1,4)' - nu_y_2).^2;
    sigma_2 = exp(-g*d_2);
    denom_2 = sum(sigma_2);
    omega_2 = sigma_2 ./ repmat(denom_2, 4, 1);
    Ind_2 = sub2ind(size(z), nu_x_2(:), nu_y_2(:));
    w=permute(sum(omega_2.*reshape(double(z(Ind_2)),4,length(u(:,1)),length(u))),[3,2,1]);
end