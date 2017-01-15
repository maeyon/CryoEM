function [y, z, filename_new] = myprepare(filename) %‰æ‘f’l‚ÌXV
y = imread(filename);
z = max(0, y-100);
filename_new = strrep(filename, '.jpg', '_update.jpg');
imwrite(z,filename_new);