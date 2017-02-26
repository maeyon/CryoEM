function I_P = double_helix_imp1(T_C, a)%[I_P i_p] = double_helix(T_C, a)
u1 = 0:1200;u2=-0.5:1200.5;
v1 = -50:50;v2=-50.5:50.5;
w1 = -50:50;w2=-50.5:50.5;
R = length(u1)/20;%���S�~�̔��a
r = R;%�������q�̔��a
T_C = 100; %max(u)/12;%���S�̎���
T_S = 75; %6/4*T_C;%�P�x�l�̎���
V_11=R*cos(2*pi*u1/T_C)+50;V_12=R*cos(2*pi*u2/T_C)+50;%����1�̒��S��x���W
W_11=R*sin(2*pi*u1/T_C)+50;W_12=R*sin(2*pi*u2/T_C)+50;%����1�̒��S��y���W
V_21=-R*cos(2*pi*u1/T_C)+50;V_22=-R*cos(2*pi*u2/T_C)+50;%����2�̒��S��x���W
W_21=-R*sin(2*pi*u1/T_C)+50;W_22=-R*sin(2*pi*u2/T_C)+50;%����2�̒��S��y���W 
a = 0.1;
b = 0.5;%�ς��Ȃ������ǂ�
c = 0.3-a; %a���傫�Ȓl�̕����ǂ�
f_S1 = a*cos(2*pi*u1/T_S)+c;f_S2 = a*cos(2*pi*u2/T_S)+c;%�����̋P�x�l
f_B = b;%�w�i�̋P�x�l
%�P�x�l�̑��
I_1 = zeros(length(u1), length(v1), length(w1));
for i=1:length(u1)
    for j=1:length(v1)
        for k=1:length(w1)
            if (j-V_11(i))^2+(k-W_11(i))^2 <= r^2 %����1�ɓ��邩
                I_1(i,j,k) = f_S1(i);
            elseif (j-V_21(i))^2+(k-W_21(i))^2 <= r^2%����2�ɓ��邩
                if i+T_S/2 <= length(u1)
                    I_1(i,j,k) = (f_S1(floor(i+T_S/2))+f_S1(ceil(i+T_S/2)))/2;
                else
                    l = i-T_S;
                    I_1(i,j,k) = (f_S1(floor(l+T_S/2))+f_S1(ceil(l+T_S/2)))/2;
                end
            else %�ǂ���ɂ�����Ȃ��ꍇ
                I_1(i,j,k) = f_B;
            end
        end
    end
end

I_2 = zeros(length(u2), length(v2), length(w2));
for i=1:length(u2)
    for j=1:length(v2)
        for k=1:length(w2)
            if (j-V_12(i))^2+(k-W_12(i))^2 <= r^2 %����1�ɓ��邩
                I_2(i,j,k) = f_S2(i);
            elseif (j-V_22(i))^2+(k-W_22(i))^2 <= r^2%����2�ɓ��邩
                if i+T_S/2 <= length(u2)
                    I_2(i,j,k) = (f_S2(floor(i+T_S/2))+f_S2(ceil(i+T_S/2)))/2;
                else
                    l = i-T_S;
                    I_2(i,j,k) = (f_S2(floor(l+T_S/2))+f_S2(ceil(l+T_S/2)))/2;
                end
            else %�ǂ���ɂ�����Ȃ��ꍇ
                I_2(i,j,k) = f_B;
            end
        end
    end
end

I_P1 = permute(sum(I_1, 3),[2,1,3]);I_P2 = permute(sum(I_2, 3),[2,1,3]);%w�����Ɏˉe%I_P = permute(sum(I, 2),[3,1,2]);%v�����Ɏˉe
% I_P_noise = I_P + 2*randn(size(I_P)); %noise�����������ꍇ
% image(I_P,'XData',u,'YData',v), axis image,colormap(jet(150));xlabel('u');ylabel('v');%���e�}��}��
% I_P = permute(sum(I, 3)/101,[2,1,3]);%imshow���g���ꍇ
% imshow(I_P(:,1:300), 'InitialMagnification','fit');

%% Equation of Plains & Estimation of Brightness
vec1=zeros(length(v1),length(u1));vec2=zeros(length(v1),length(u1));vec3=zeros(length(v1),length(u1));vec4=zeros(length(v1),length(u1));
n1=zeros(length(v1),length(u1),3);n2=zeros(length(v1),length(u1),3);n3=zeros(length(v1),length(u1),3);n4=zeros(length(v1),length(u1),3);
u3=0:0.1:length(u1)/0.1+1;v3=min(v1)/0.1:0.1:max(v1)/2/0.1;I_P_imp=zeros(length(u3), length(v3));
for i=1:length(v1)
    for j=1:length(u1)
        vec1(i,j)=I_P2(i+1,j+1)-I_P1(i,j);vec2(i,j)=I_P2(i+1,j)-I_P1(i,j);vec3(i,j)=I_P2(i,j)-I_P1(i,j);vec4(i,j)=I_P2(i,j+1)-I_P1(i,j);
        %Creation of Normal vectors
        n1(i,j,:)=cross([0.5, 0.5 vec1(i,j)], [0.5, -0.5 vec2(i,j)]);
        n2(i,j,:)=cross([0.5, -0.5 vec2(i,j)], [-0.5, -0.5 vec3(i,j)]);
        n3(i,j,:)=cross([-0.5, -0.5 vec3(i,j)], -[0.5, 0.5 vec4(i,j)]);
        n4(i,j,:)=cross([-0.5, 0.5 vec4(i,j)], [0.5, 0.5 vec1(i,j)]);
        for k=1:5
            for l=1:2*k+1
                I_P_imp(10*i+k,10*j) = -(n1(i,j,1)*(u3(10*i+k)-i)+n1(i,j,2)*(v3(10*j+l-k)-j)+I_P1(i,j))/n1(i,j,3);
                I_P_imp(10*i,10*j-k) = -(n2(i,j,1)*(u3(10*i+l-k)-i)+n2(i,j,2)*(v3(10*j-k)-j)+I_P1(i,j))/n2(i,j,3);
                I_P_imp(10*i-k,10*j) = -(n3(i,j,1)*(u3(10*i-k)-i)+n3(i,j,2)*(v3(10*j+l-k)-j)+I_P1(i,j))/n3(i,j,3);
                I_P_imp(10*i,10*j+k) = -(n4(i,j,1)*(u3(10*i+l-k)-i)+n4(i,j,2)*(v3(10*j+k)-j)+I_P1(i,j))/n4(i,j,3);
            end
        end
    end
end

% 
% i_p=fftshift(fft2(I_P));
% x = (-0.5:1/1200:0.5);
% y = (-0.5:1/100:0.5);
% image(abs(i_p),'XData',x,'YData',y), axis image, colormap(jet(300));
end