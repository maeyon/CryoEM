function  myfft2 %“ñŸŒ³ƒt[ƒŠƒG•ÏŠ·
%F = fft2(z);
%F2 = fftshift(F);
%imshow(log(abs(F2)),[-4 13]);
%colormap(jet); colorbar

f = zeros(30,30);
f(5:24,13:17) = 1;
F = fft2(f,256,256);
F2 = fftshift(F);
imshow(abs(F2),[-1 5]); colormap(jet);
colorbar
end