z = (1:1200);
R = 30;%中心円の半径
r = R;%螺旋分子の半径
T = max(z)/12;%中心の周期
t = 3*T/4;%輝度値の周期
X_1 = R*cos(2*pi*z/T)+50;%螺旋1の中心のx座標
Y_1 = R*sin(2*pi*z/T)+50;%螺旋1の中心のy座標
X_2 = -R*cos(2*pi*z/T)+50;%螺旋2の中心のx座標
Y_2 = -R*sin(2*pi*z/T)+50;%螺旋2の中心のy座標 
f_B = 1/3;%背景の輝度値
f_1 = f_B*(cos(2*pi*z/t)+3/2);%螺旋1の輝度値
f_2 = f_B*(cos(2*pi*z/t)+3/2);%螺旋2の輝度値
%輝度値の代入
I = zeros(101, 101, 1200);
for z=1:1200
    for x=1:101
        for y=1:101
            if (x-X_1(z))^2+(y-Y_1(z))^2 <= r^2 %螺旋1に入るか
                I(x,y,z) = f_1(z);
            elseif (x-X_2(z))^2+(y-Y_2(z))^2 <= r^2%螺旋2に入るか
                I(x,y,z) = f_2(z);
            else %どちらにも入らない場合
                I(x,y,z) = f_B;
            end
        end
    end
end
I_P = permute(sum(I, 1)/101,[3,2,1]);%y方向に射影
imshow(I_P,'InitialMagnification','fit');
i_p=fftshift(fft2(I_P));
x = [1/1200 1];
y = [1/101 1];
image(abs(i_p),'XData',x,'YData',y), axis image, colormap(jet(7));