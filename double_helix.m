u = 0:1200;
v = -50:50;
w = -50:50;
R = 5;%���S�~�̔��a
r = 5;%�������q�̔��a
T = max(u)/12;%���S�̎���
t = 3*T/4;%�P�x�l�̎���
V_1 = R*cos(2*pi*u/T)+50;%����1�̒��S��x���W
W_1 = R*sin(2*pi*u/T)+50;%����1�̒��S��y���W
V_2 = -R*cos(2*pi*u/T)+50;%����2�̒��S��x���W
W_2 = -R*sin(2*pi*u/T)+50;%����2�̒��S��y���W 
a = 1/10;
b = 1;%�ς��Ȃ������ǂ�
c = 1/5; %a���傫�Ȓl�̕���������
f_S = a*cos(2*pi*u/t)+c;%�����̋P�x�l
f_B = b;%�w�i�̋P�x�l
%�P�x�l�̑��
I = zeros(1201, 101, 101);
for i=1:1201
    for j=1:101
        for k=1:101
            if (j-V_1(i))^2+(k-W_1(i))^2 <= r^2 %����1�ɓ��邩
                I(i,j,k) = f_S(i);
            elseif (j-V_2(i))^2+(k-W_2(i))^2 <= r^2%����2�ɓ��邩
                if i+t/2 <= 1201
                    I(i,j,k) = (f_S(floor(i+t/2))+f_S(ceil(i+t/2)))/2;
                else
                    l = i-t;
                    I(i,j,k) = (f_S(floor(l+t/2))+f_S(ceil(l+t/2)))/2;
                end
            else %�ǂ���ɂ�����Ȃ��ꍇ
                I(i,j,k) = f_B;
            end
        end
    end
end
I_P = permute(sum(I, 3),[2,1,3]);%w�����Ɏˉe%I_P = permute(sum(I, 2),[3,1,2]);%v�����Ɏˉe
image(I_P,'XData',u,'YData',v), axis image, colormap(jet(200));xlabel('u');ylabel('v');
%I_P = permute(sum(I, 3)/101,[2,1,3]);%imshow���g���ꍇ
%imshow(I_P, 'InitialMagnification','fit');

%i_p=fftshift(fft2(I_P));
%v = [1/1200 1];
%w = [1/101 1];
%image(abs(i_p),'XData',v,'YData',w), axis image, colormap(jet(7));