%��f�l���X�V����
function [y] = myprepare(filemame)

y = imread(filemame);

y = max(0, y-1);