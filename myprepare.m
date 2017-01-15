function [y, z, filename_new] = myprepare(filename) %画素値の更新
y = imread(filename);
z = max(0, y-100);
filename_new = strrep(filename, '.jpg', '_update.jpg');
imwrite(z,filename_new);