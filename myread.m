%画像の読み込み
function [y,tc,tr] = myread(filemame)
y = imread(filemame);
[tc,tr] = find(y == 255);
t = [tc(:) tr(:)];