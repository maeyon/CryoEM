%�摜�̓ǂݍ���
function [y, t] = myread(filemame)

y = imread(filemame);

t = find(y == 255);