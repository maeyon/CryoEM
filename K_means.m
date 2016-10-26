rng default;

% (0, 0)と(2,2)を中心とした2次元ガウス分布を作る
X = [randn(100, 2);
    randn(100, 2) + 3*ones(100, 2)];

figure;
plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';

% データを二つのクラスターに分割する
% アルゴリズムで表示される最終出力をoptsに代入
opts = statset('Display','final');
% idx: クラスターインデックス
% C: クラスター重心位置
% cityblock:差の絶対値の総和
% Replicates:新規の初期クラスター重心位置を使用するクラスタリングの反復回数
% Options:近似基準を最小化する反復アルゴリズムの制御オプション
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);

% クラスターとクラスター重心をプロット
figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
    'MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Centroids',...
    'Location','NW')
title 'Cluster Assignments and Centroids'
hold off