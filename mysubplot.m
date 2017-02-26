x = (-0.5:1/1200:0.5);
y = (-0.5:1/100:0.5);
figure
% subplot(1,2,1)
% imshow(I_P_1, 'InitialMagnification','fit');
% title('T_C=100, a=0.05, c=0.25')
% 
% subplot(1,2,2)
% image(abs(i_p_1),'XData',x,'YData',y), axis image, colormap(jet(300));
% title('T_C=100, a=0.05, c=0.25')
% 
% subplot(1,2,1)
% imshow(I_P_2, 'InitialMagnification','fit');
% title('T_C=100, a=0.10, c=0.20')
% 
% subplot(1,2,2)
% image(abs(i_p_2),'XData',x,'YData',y), axis image, colormap(jet(300));
% title('T_C=100, a=0.10, c=0.20')
% 
% subplot(1,2,1)
% imshow(I_P_3, 'InitialMagnification','fit');
% title('T_C=100, a=0.15, c=0.15')
% 
% subplot(1,2,2)
% image(abs(i_p_3),'XData',x,'YData',y), axis image, colormap(jet(300));
% title('T_C=100, a=0.15, c=0.15')

% subplot(1,2,1)
% imshow(I_P_4, 'InitialMagnification','fit');
% title('T_C=60, a=0.05, c=0.25')
% 
% subplot(1,2,2)
% image(abs(i_p_4),'XData',x,'YData',y), axis image, colormap(jet(300));
% title('T_C=60, a=0.05, c=0.25')

% subplot(1,2,1)
% imshow(I_P_5, 'InitialMagnification','fit');
% title('T_C=60, a=0.10, c=0.20')
% 
% subplot(1,2,2)
% image(abs(i_p_5),'XData',x,'YData',y), axis image, colormap(jet(300));
% title('T_C=60, a=0.10, c=0.20')

subplot(1,2,1)
imshow(I_P_6, 'InitialMagnification','fit');
title('T_C=60, a=0.15, c=0.15')

subplot(1,2,2)
image(abs(i_p_6),'XData',x,'YData',y), axis image, colormap(jet(300));
title('T_C=100, a=0.15, c=0.15')