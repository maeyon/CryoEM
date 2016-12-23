%スプライン補間 (in: t, out:a)
%a = (a, b, c, d)
function [a] = myspline(t)
% 定義
N = length(t(:,1));
h = zeros(N, 2);
v = zeros(N-1, 1);

for i = 0 : N-1
    for j = 1 : 2
        h(i, j) = t(i+1, j) - t(i, j);
    end
    if i ~= 0
        v(i) = 6 * (h(i, 2) / h(i, 1) - h(i-1, 2) / h(i-1, 2));
    end
end

%行列Hの生成
H = zeros(N-1);
for i = 1 : N-1
    for j = 1 : N-1
        if i == j
            H(i,j) = 2*(h(i-1, 1)+h(i, 1));
        elseif abs(i,j) == 1
            H(i,j) = h(min(i,j), 1);
        else H(i,j) = 0;
        end
    end
end

%u, a,b,c,d, 区分多項式, 曲線を求める
u = zeros(N+1, 1);
a = zeros(N, 1);
b = zeros(N, 1);
c = zeros(N, 1);
d = zeros(N, 1);
S = zeros(N, 1);
u(0) = 0;
u(N) = 0;
G = inv(H);
Tx = zeros(10000);
Ty = zeros(10000);
Tx = t(0, 1):(t(N, 1)-t(0, 1))/10000:t(N, 1);
for j = 0 : N-1
    if j ~= N-1
        u(j+1) = symsum(G(j+1, i) * v(i), i, 1, N-1);
    end
    a(j) = (u(j+1)-u(j)) / (6*h(j, 1));
    b(j) = u(j) / 2;
    c(j) = h(j, 2) / h(j, 1) - h(j, 1)*(2*u(j)+u(j+1)) / 6;
    d(j) = t(j, 2);
    S(j) = a(j)*(Tx - t(j, 1))^3 + b(j)*(Tx - t(j, 1))^2 + c(j)*(Tx - t(j, 1)) + d(j);
    if Tx >= t(j, 1) && Tx <= t(j+1, 1)
        Ty = S(j);
    end
end

s = [a(:) b(:) c(:) d(:)];

end