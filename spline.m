%スプライン補間 (in: x, y, out: )

% 定義
N = length(x);
h = zeros(N, 1);
w = zeros(N, 1);
v = zeros(N-1, 1);
for j = 0 : N-1
    h(j) = x(j+1) - x(j);
    w(j) = y(j+1) - y(j);
    if j ~= 0
        v(j) = 6 * (w(j) / h(j) - w(j-1) / h(j-1));
    end
end

%行列Hの生成
H = zeros(N-1);
for i = 1:N-1
    for j = 1:N-1
        if i == j
            H(i,j) = 2*(h_(i-1)+h(i));
        elseif abs(i,j) == 1
            H(i,j) = h(min(i,j));
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
X = x(0):(x(N)-x(0))/10000:x(N);
for j = 0 : N-1
    if j ~= N-1
        u(j+1) = symsum(G(j+1, i) * v(i), i, 1, N-1);
    end
    a(j) = (u(j+1)-u(j)) / (6*h(j));
    b(j) = u(j) / 2;
    c(j) = (y(j+1) - y(j)) / h(j) - h(j)*(2*u(j)+u(j+1)) / 6;
    d(j) = y(j);
    S(j) = a(j)*(X-x(j))^3 + b(j)*(X-x(j))^2 + c(j)*(X-x(j)) + d(j);
    if X >= x(j) && X <= x(j+1)
        Y = S(j);
    end
end