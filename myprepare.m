%‰æ‘f’l‚ğXV‚·‚é
%function [y] = myprepare(filemame)
filename = 'F2609_contrast_adjusted.jpg';
a = imread(filename);
b = max(0, y-1);
%filename_2 = strcat(filename,'_update');
imwrite(b, 'F2609_contrast_adjusted_update.jpg')