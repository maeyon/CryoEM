rng default;

% (0, 0)��(2,2)�𒆐S�Ƃ���2�����K�E�X���z�����
X = [randn(100, 2);
    randn(100, 2) + ones(100, 2)];

figure;
plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';

