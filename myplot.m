%�Ԋue���Ƃ̃v���b�g
function mu = myplot(T, y)

%�Ԋue���ƂɃv���b�g
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