%スプライン補間 (in: t, out:a)
%s = (a, b, c, d)
function s = myspline_est(tc,tr)
% 定義
h = tc(2:end)-tc(1:end-1);
v = 6*((tr(3:end)-tr(2:end-1))./h(2:end) + tr(2:end-1)-tr(1:end-2)./h(1:end-1));

%行列Hの生成
diagH_0 = 2*(h(1:end-1) + h(2:end));
N = length(diagH_0);
H_0 = diag(diagH_0);
diagH_1 = h(2:end-1);
H_1 = [zeros(N-1,1), diag(diagH_1) ; zeros(1,N)];
H_2 = [zeros(1,N) ; diag(diagH_1), zeros(N-1,1)];
H = H_0 + H_1 + H_2;

%u, a,b,c,d, 区分多項式, 曲線を求める
w = H\v;
u = [0 ; w(:) ; 0];
a = u(2:end) - u(1:end-1) ./ (6*h);
b = u(1:end-1) / 2;
c = (tr(2:end) - tr(1:end-1)) ./ h(1:end) - h(1:end).*(2*u(1:end-1)+u(2:end))/6;
d = tr(1:end-1);
s = [a(:) b(:) c(:) d(:)];
end