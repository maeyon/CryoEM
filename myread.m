%画像の読み込み
function [y, t] = myread(filemame)

y = imread(filemame);

t = find(y == 0)