%画像の読み込み
function [y,tc,tr] = myread(filemame)
y = imread(filemame);
[temp_tc,temp_tr] = find(y(:,:,1)==255 & y(:,:,2)==255 & y(:,:,3)==255);
[tc, I]= sort(temp_tc);
tr = temp_tr(I);
end