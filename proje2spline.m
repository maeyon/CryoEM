%曲線(t, a)と格子点(x', y')を入力すると、格子から曲線に対して下した垂線の交点(alpha,
%beta)と始点から交点までの曲線に沿った距離u, 格子点と交点の距離vを返す関数
function [alpha, beta, u, v] = proje2spline(t, s, x', y')

%始点と終点を結ぶ直線を引く
A = [tc(1) 1 ; tc(N+1) 1];
B = [tr(1) ; t(N+1)];
C = inv(A) * B;

%任意の格子点(x, y)を通り、上で求めた直線に垂線な直線を求める
D = y + C(1) * x;

%直線とスプライン曲線の交点を求める
syms x
for i = 0 : N
    solve(a(i)*x^3 + b(i)*x^2 + c(i)*x + d(i) - C(1) * x - D, x);
        if x >= x(i) && x <= x(i+1)
            break
        end
end

%格子点(x, y)とスプライン曲線の距離の関数を求める


%(alpha, beta)の初期値が求まったので、ニュートン法を3回繰り返し、(alpha, beta)を更新


%その格子点を(u, v)座標で表す
u = sum 