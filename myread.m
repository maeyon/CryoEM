function [y,tc,tr] = myread(filename_new) %‰æ‘œ‚Ì“Ç‚İ‚İ
y = imread(filename_new);
tc = [100, 200, 400, 800, 1800];
tr = [948+12*rand(1), 948-12*rand(1), 948+12*rand(1), 948-12*rand(1), 948+12*rand(1)];
%[temp_tc,temp_tr] = find(y(:,:,1)==255 & y(:,:,2)==255 & y(:,:,3)==255);
%[tc, I]= sort(temp_tc);
%tr = temp_tr(I);
end