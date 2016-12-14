%‰æ‘œ‚Ì“Ç‚İ‚İ
function [y, t] = myread(filemame)

y = imread(filemame);

t = find(y == 255);