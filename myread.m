%�摜�̓ǂݍ���
function [y,tc,tr] = myread(filemame)
y = imread(filemame);
[tc,tr] = find(y(:,:,1)==255 & y(:,:,2)==255 & y(:,:,3)==255);
end