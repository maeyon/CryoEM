u = 0:1200;
v = -50:50;
w = -50:50;
R = 5;%中心円の半径
r = 5;%螺旋分子の半径
T = max(u)/12;%中心の周期
t = 3*T/4;%輝度値の周期
V_1 = R*cos(2*pi*u/T)+50;%螺旋1の中心のx座標
W_1 = R*sin(2*pi*u/T)+50;%螺旋1の中心のy座標
V_2 = -R*cos(2*pi*u/T)+50;%螺旋2の中心のx座標
W_2 = -R*sin(2*pi*u/T)+50;%螺旋2の中心のy座標 
a = 1/10;
b = 1;%変えない方が良い
c = 1/5; %aより大きな値の方が嬉しい
f_S = a*cos(2*pi*u/t)+c;%螺旋の輝度値
f_B = b;%背景の輝度値
%輝度値の代入
I = zeros(1201, 101, 101);
for i=1:1201
    for j=1:101
        for k=1:101
            if (j-V_1(i))^2+(k-W_1(i))^2 <= r^2 %螺旋1に入るか
                I(i,j,k) = f_S(i);
            elseif (j-V_2(i))^2+(k-W_2(i))^2 <= r^2%螺旋2に入るか
                if i+t/2 <= 1201
                    I(i,j,k) = (f_S(floor(i+t/2))+f_S(ceil(i+t/2)))/2;
                else
                    l = i-t;
                    I(i,j,k) = (f_S(floor(l+t/2))+f_S(ceil(l+t/2)))/2;
                end
            else %どちらにも入らない場合
                I(i,j,k) = f_B;
            end
        end
    end
end
I_P = permute(sum(I, 3),[2,1,3]);%w方向に射影%I_P = permute(sum(I, 2),[3,1,2]);%v方向に射影
image(I_P,'XData',u,'YData',v), axis image, colormap(jet(200));xlabel('u');ylabel('v');
%I_P = permute(sum(I, 3)/101,[2,1,3]);%imshowを使う場合
%imshow(I_P, 'InitialMagnification','fit');

%i_p=fftshift(fft2(I_P));
%v = [1/1200 1];
%w = [1/101 1];
%image(abs(i_p),'XData',v,'YData',w), axis image, colormap(jet(7));