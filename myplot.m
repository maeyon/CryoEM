%間隔eごとのプロット
function mu = myplot(T, y)

%始点からの曲線上の距離を不定積分で求める
syms T(:, 1)
u = int(sqrt(1 + diff(T(:, 2), T(:, 1))^2));

%eの間隔を決める
e = l / 100;

%間隔eごとにプロット
mu = zeros(101, 3);
for i = 0:100
    for j = 0:100
        for k = 0:10000
            if u(k) == j*e
                mu(i) = T(k, :);
            end
        end
    end
end
end