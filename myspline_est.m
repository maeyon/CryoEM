%スプライン補間 (in: t, out:a)
%s = (a, b, c, d)
function [s,Tx,Ty] = myspline_est(tc,tr)
% 定義
h = tc(2:end)-tc(1:end-1);
v = 6*((tr(3:end)-tr(2:end-1))./h(2:end) + tr(2:end-1)-tr(1:end-2)./h(1:end-1));

%行列Hの生成
diagH = 2*(h(1:end-2) + h(2:end-1));
H = diag(diagH);
H([1:end-1], [2:end]) = h(2:end-2);
H([2:end], [1:end-1]) = h(2:end-2);

%u, a,b,c,d, 区分多項式, 曲線を求める
w = H\v;
u = [0 ; w(:) ; 0];

a = u(2:end) - u(1:end-1) ./ (6*h);
b = u(1:end-1) / 2;
c = (tr(2:end) - tr(1:end-1)) ./ h(1:end) - h(1:end).*(2*u(1:end-1)+u(2:end))/6;
d = tr(1:end-1);
s = [a(:) b(:) c(:) d(:)];

Ty = zeros(10001, 1);
Tx = tc(1):(tc(end)-tc(1))/10000:tc(end);
for j = 1 : 4-1
    index = find((Tx >= tc(j)).*(Tx <= tc(j+1)));
    Ty(index) =  a(j)*(Tx(index) - tc(j)).^3 + b(j)*(Tx(index) - tc(j)).^2 + c(j)*(Tx(index) - tc(j)) + d(j);
end
end