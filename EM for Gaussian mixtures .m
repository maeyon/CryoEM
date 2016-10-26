rng default;

% (0, 0)と(2,2)を中心とした2次元ガウス分布を作る
X = [randn(100, 2);
    randn(100, 2) + ones(100, 2)];

figure;
plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';

