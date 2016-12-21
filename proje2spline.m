%曲線(t, a)と格子点(x', y')を入力すると、格子から曲線に対して下した垂線の交点(alpha,
%beta)と始点から交点までの曲線に沿った距離u, 格子点と交点の距離vを返す関数
function [alpha, beta, u, v] = proje2spline(t, s, x', y')


%始点からの曲線上の距離を不定積分で求める
syms T(:, 1)
u = int(sqrt(1 + diff(T(:, 2), T(:, 1))^2));
l = 