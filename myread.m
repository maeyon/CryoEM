%‰æ‘œ�?Ì�?�??Ýž‚�?
function [y, t,tc,tr] = myread(filemame)

y = imread(filemame);

%[tc,tr] = find(y == 255);
%t = [tc(:) tr(:)];
t = rand(4, 2);
tc = t(:,1);
tr = t(:,2);