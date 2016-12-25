%‰æ‘f’l‚ğXV‚·‚é
%function [b] = myprepare(filemame)
filename = 'F2609_contrast_adjusted.jpg';
a = imread(filename);
b = max(0, a-100);
%filename_2 = strcat(filename,'_update');
imwrite(b,'F2609_contrast_adjusted_update.jpg');
