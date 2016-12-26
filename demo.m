%中心線に添って周期Lを求めるプログラム

%入力
    %観測画像スプライン補間の二次元座標(観測画像上の画素インデックス)をN点 (2xN)の行列
    %スプライン曲線上にとる点の間隔 e式
    %(21)の補間の重みγ
    %スプライン曲線上にとる点の始点S)

%出力：始点S から間隔e ごとにとったスプライン曲線上の補間した「画素値の列」とその「位置座標」

z=imread('F2609_contrast_adjusted.jpg');
filename='F2609_contrast_adjusted_update.jpg';

%画像を読み込む (in: 画像, out: y, t)
%y = (x, y, 輝度値)
%t = (x, y)
[y,tc,tr]=myread(filename);

%スプライン補間 (in: t, out:t)
%t = (a, b, c, d)
s = myspline_est(tc,tr);
Tx = tc(1):(tc(end)-tc(1))/10000:tc(end);
Ty = myspline(Tx,s,tc);

%曲線上に間隔eごとにプロット (in:T, out:mu)
%mu = (x, y, 輝度値=0)
%n:任意の整数。ここを変数にしてeの大きさを変える

%始点から終点までの距離lを測る
l = sum(sqrt(1+diff(Ty).^2));

%間隔eを決める
n = 100;
e = l / n;

[mu_x, mu_y] = myplot(Tx,Ty,e, s, tc);

%曲線上の輝度値の推定 (in:y, mu, g, out:mu)
%mu = (x, y, 輝度値)
g = 5;
mu = mybright(z, mu_x, mu_y, g, n);

%フーリエ変換
%q = [0, cumsum(sqrt(1+(diff(mu_y)./diff(mu_x)).^2))];
mu_z = mu(:,3);
L = fft(mu_z);
%任意の座標(x, y)における曲線に
%alpha, beta 
%u, v 曲線が直線になるような新しい基底
%[alpha, beta, u, v] = proje2spline(t, a, x, y);