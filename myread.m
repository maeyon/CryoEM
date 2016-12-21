%‰æ‘œ�?Ì�?�??Ýž‚�?
function [y, t] = myread(filemame)

y = imread(filemame);

[tc,tr] = find(y == 255);
t = [tc(:) tr(:)];