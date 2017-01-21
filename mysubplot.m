figure
subplot(3,2,1)
imshow(I_P_1, 'InitialMagnification','fit');
title('T_C=100, a=0.05, c=0.25')
subplot(3,2,2)
imshow(I_P_2, 'InitialMagnification','fit');
title('T_C=60, a=0.05, c=0.25')
subplot(3,2,3)
imshow(I_P_4, 'InitialMagnification','fit');
title('T_C=100, a=0.10, c=0.20')
subplot(3,2,4)
imshow(I_P_3, 'InitialMagnification','fit');
title('T_C=60, a=0.10, c=0.20')
subplot(3,2,5)
imshow(I_P_5, 'InitialMagnification','fit');
title('T_C=100, a=0.15, c=0.15')
subplot(3,2,6)
imshow(I_P_6, 'InitialMagnification','fit');
title('T_C=60, a=0.15, c=0.15')