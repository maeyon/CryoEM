function [I_P i_p] = double_helix(T_C, a)
u = 0:1200;
v = -50:50;
w = -50:50;
R = 5;%���S�~�̔��a
r = 5;%�������q�̔��a
%T_C = 100; %max(u)/12;%���S�̎���
T_S = 75; %6/4*T_C;%�P�x�l�̎���
V_1 = R*cos(2*pi*u/T_C)+50;%����1�̒��S��x���W
W_1 = R*sin(2*pi*u/T_C)+50;%����1�̒��S��y���W
V_2 = -R*cos(2*pi*u/T_C)+50;%����2�̒��S��x���W
W_2 = -R*sin(2*pi*u/T_C)+50;%����2�̒��S��y���W 
%a = 0.1;
b = 0.5;%�ς��Ȃ������ǂ�
c = 0.3-a; %a���傫�Ȓl�̕����ǂ�
f_S = a*cos(2*pi*u/T_S)+c;%�����̋P�x�l
f_B = b;%�w�i�̋P�x�l
%�P�x�l�̑��
I = zeros(length(u), length(v), length(w));
for i=1:length(u)
    for j=1:length(v)
        for k=1:length(w)
            if (j-V_1(i))^2+(k-W_1(i))^2 <= r^2 %����1�ɓ��邩
                I(i,j,k) = f_S(i);
            elseif (j-V_2(i))^2+(k-W_2(i))^2 <= r^2%����2�ɓ��邩
                if i+T_S/2 <= length(u)
                    I(i,j,k) = (f_S(floor(i+T_S/2))+f_S(ceil(i+T_S/2)))/2;
                else
                    l = i-T_S;
                    I(i,j,k) = (f_S(floor(l+T_S/2))+f_S(ceil(l+T_S/2)))/2;
                end
            else %�ǂ���ɂ�����Ȃ��ꍇ
                I(i,j,k) = f_B;
            end
        end
    end
end
%I_P = permute(sum(I, 3),[2,1,3]);%w�����Ɏˉe%I_P = permute(sum(I, 2),[3,1,2]);%v�����Ɏˉe
%I_P_noise = I_P + 2*randn(size(I_P)); %noise�����������ꍇ
%image(I_P,'XData',u,'YData',v), axis image,colormap(jet(35));xlabel('u');ylabel('v');%���e�}��}��
I_P = permute(sum(I, 3)/101,[2,1,3]);%imshow���g���ꍇ
%imshow(I_P, 'InitialMagnification','fit');

i_p=fftshift(fft2(I_P));
%x = (-0.5:1/1200:0.5);
%y = (-0.5:1/100:0.5);
%image(abs(i_p),'XData',x,'YData',y), axis image, colormap(jet(300));
end