%画素値を更新する
function [y] = myprepare(filemame)

y = imread(filemame);

y = max(0, y-1);

filename_2 = strcat(filename,'_update');
 
imwrite(y, filename_2)