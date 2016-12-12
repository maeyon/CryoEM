%間隔eごとのプロット
%始点からの曲線上の距離を不定積分で求める
syms X
u = int(sqrt(1 + diff(Y, X)^2));

%eの間隔を決める
e = l / 100;

%間隔eごとにプロット
mu = zeros(101, 1);
for i = 0:100
    for j = 0:100
        for k = 0:10000
            if u(k) == j*e
                mu(i) = [X(k), Y(k)];
            end
        end
    end
end
