%間隔eごとのプロット
function mu = myplot(T, y)

%間隔eごとにプロット
mu = zeros(101, 2);
for i = 0:100
    for j = 0:100
        for k = 0:10000
            if u(k) == j * e
                mu(i) = T(k, :);
            end
        end
    end
end
end