rng default;

% (0, 0)��(2,2)�𒆐S�Ƃ���2�����K�E�X���z�����
X = [randn(100, 2);
    randn(100, 2) + 3*ones(100, 2)];

figure;
plot(X(:,1),X(:,2),'.');
title 'Randomly Generated Data';

% �f�[�^���̃N���X�^�[�ɕ�������
% �A���S���Y���ŕ\�������ŏI�o�͂�opts�ɑ��
opts = statset('Display','final');
% idx: �N���X�^�[�C���f�b�N�X
% C: �N���X�^�[�d�S�ʒu
% cityblock:���̐�Βl�̑��a
% Replicates:�V�K�̏����N���X�^�[�d�S�ʒu���g�p����N���X�^�����O�̔�����
% Options:�ߎ�����ŏ������锽���A���S���Y���̐���I�v�V����
[idx,C] = kmeans(X,2,'Distance','cityblock',...
    'Replicates',5,'Options',opts);

% �N���X�^�[�ƃN���X�^�[�d�S���v���b�g
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