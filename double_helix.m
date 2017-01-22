function [I_P i_p] = double_helix(T_C, a)
u = 0:1200;
v = -50:50;
w = -50:50;
R = 5;%中心円の半径
r = 5;%螺旋分子の半径
%T_C = 100; %max(u)/12;%中心の周期
T_S = 75; %6/4*T_C;%輝度値の周期
V_1 = R*cos(2*pi*u/T_C)+50;%螺旋1の中心のx座標
W_1 = R*sin(2*pi*u/T_C)+50;%螺旋1の中心のy座標
V_2 = -R*cos(2*pi*u/T_C)+50;%螺旋2の中心のx座標
W_2 = -R*sin(2*pi*u/T_C)+50;%螺旋2の中心のy座標 
%a = 0.1;
b = 0.5;%変えない方が良い
c = 0.3-a; %aより大きな値の方が良い
f_S = a*cos(2*pi*u/T_S)+c;%螺旋の輝度値
f_B = b;%背景の輝度値
%輝度値の代入
I = zeros(length(u), length(v), length(w));
for i=1:length(u)
    for j=1:length(v)
        for k=1:length(w)
            if (j-V_1(i))^2+(k-W_1(i))^2 <= r^2 %螺旋1に入るか
                I(i,j,k) = f_S(i);
            elseif (j-V_2(i))^2+(k-W_2(i))^2 <= r^2%螺旋2に入るか
                if i+T_S/2 <= length(u)
                    I(i,j,k) = (f_S(floor(i+T_S/2))+f_S(ceil(i+T_S/2)))/2;
                else
                    l = i-T_S;
                    I(i,j,k) = (f_S(floor(l+T_S/2))+f_S(ceil(l+T_S/2)))/2;
                end
            else %どちらにも入らない場合
                I(i,j,k) = f_B;
            end
        end
    end
end
%I_P = permute(sum(I, 3),[2,1,3]);%w方向に射影%I_P = permute(sum(I, 2),[3,1,2]);%v方向に射影
%I_P_noise = I_P + 2*randn(size(I_P)); %noiseを加えたい場合
%image(I_P,'XData',u,'YData',v), axis image,colormap(jet(35));xlabel('u');ylabel('v');%投影図を図示
I_P = permute(sum(I, 3)/101,[2,1,3]);%imshowを使う場合
%imshow(I_P, 'InitialMagnification','fit');

i_p=fftshift(fft2(I_P));
%x = (-0.5:1/1200:0.5);
%y = (-0.5:1/100:0.5);
%image(abs(i_p),'XData',x,'YData',y), axis image, colormap(jet(300));
end