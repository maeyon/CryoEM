function [B_x,B_y,f_x,f_y]=myfft2(w,n,m,l,l_2) %二次元フーリエ変換
F_x=n/l;
F_y=m/mean(l_2);
W = fft2(w);
W2 = fftshift(W);%imshow(log(abs(W2)),[min(min(log(abs(W2)))) max(max(log(abs(W2))))]);colormap(jet); colorbar

%x = [F_x/n F_x];
%y = [F_y/m F_y];
%image(log(abs(W2)),'XData',x,'YData',y), axis image, colormap(jet(25))

Mu_2=sum(W2,2)/m;%Mu = fft(mu_z);
B2_x = abs(Mu_2/n);
B_x = B2_x(2:ceil(n/2+1));
B_x(2:end-1) = 2*B_x(2:end-1);
f_x = F_x*(0:ceil((n/2)))/n;

Mu_3=sum(W2,1)/m;%Mu = fft(mu_z);
B2_y = abs(Mu_3/m);
B_y = B2_y(1:ceil(m/2+1));
B_y(2:end-1) = 2*B_y(2:end-1);
f_y = F_y*(0:ceil((m/2)))/m;
x = [1 ceil(l)];
y = [1 ceil(l_2)];
end