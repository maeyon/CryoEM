%中心線に添って周期Lを求めるプログラム

%filename='F2609_contrast_adjusted.jpg';
%[y, z, filename_new] = myprepare(filemame) %画素値の更新

z = imread('checkerboard-squares-black-white.jpg');
z(:,1:912,1:3)=127;
z(:,1056:1920,1:3)=127;
filename='cb.png';

%分子構造に沿うように、filename_newの画像に4つ以上の点を手作業でプロット
%[y,tc,tr]=myread(filename_new);%画像を読み込む
tc = [100,200,400,800,1800];
tr = [948+12*rand(1),948-12*rand(1),948+12*rand(1),948-12*rand(1),948+12*rand(1)];

s = myspline_est(tc,tr);%スプライン補間
dx = (tc(end)-tc(1))/10000;
Tx = tc(1):dx:tc(end);
Ty = myspline(Tx,s,tc);

dy = diff(Ty);
l = sum(sqrt(dx^2+dy.^2)); %始点から終点までの距離lを測る
n = floor(l);
e = l/n; %間隔
[mu_x, mu_y] = myplot(Tx, dx, dy, e, s, tc, n); %曲線上に間隔eごとにプロット

g = 5; %重み
mu_z = mybright(z, mu_x, mu_y, g, n); %曲線上の輝度値の推定 (in:y, mu, g, out:mu)

[B, f] = myfft(mu_z,n,l); %フーリエ変換
L = 1/f(B == max(B));
%myfft2()

%任意の座標(x, y)における曲線に
%alpha, beta 
%u, v 曲線が直線になるような新しい基底
%[alpha, beta, u, v] = proje2spline(t, a, x, y);