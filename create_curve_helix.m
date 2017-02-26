function Z = create_curve_helix(I_P, y_1, y_2)
%% Overleaf�菇1
%xy���ʏ�̕�ԓ_��^����
x = 0:500:1000;%100:500:1100;%0:250:1000;%u=0�Ƃ���x=100�����
y = [0 y_1, y_2];%[0 100*rand 200*rand];%figure
%�X�v���C����Ԃ����ċȂ��������S����xy���ʏ�ɒ�`
xq = min(x):0.1:max(x);
yq = interp1(x,y,xq,'spline');
%plot(x,y,'o',xq,yq,':.');
%title('Spline Interpolation');
%% Overleaf�菇2 xy���ʏ�̔C�ӂ̓_(x,y)�ɂ�����_��uv���ʏ�̂ǂ̓_(u,v)�ɑΉ����邩�����߂�B
dx = (max(x)-min(x))/length(xq);
dy = diff(yq);
l = sum(sqrt(dx^2+dy.^2));
l_2 = length(I_P(:,1));
n = floor(l);%floor(l/3);
e = 1;%l/n;%xy���ʏ�̊i�q�Ԋu
d = cumsum(sqrt(dx^2 + dy.^2));
%uv���ʏ�ɂ�����xy���ʂ̊i�q
mu_x = interp1(d,xq(2:end),(1:n)*e);
grad=-dy/dx;
for i=1:length(mu_x)
    mu_y(i)=yq(find(abs(xq - mu_x(i))==min(abs(xq - mu_x(i)))));
end
for i=1:length(mu_x)-1
    slop(i)=grad(find(abs(xq - mu_x(i))==min(abs(xq - mu_x(i)))));
end
%v = zeros(2*floor(l_2/(2*e))+1,length(slop));%(2*floor(l_2/(2*e))+1,length(slop));%(2*ceil(50/e)+1, length(slop));%v = zeros(length(slop), 2*ceil(100/e)+1);
%u = zeros(2*floor(l_2/(2*e))+1,length(slop));%(2*floor(l_2/(2*e))+1,length(slop));%(2*ceil(50/e)+1, length(slop));%u = zeros(length(slop), 2*ceil(100/e)+1);
for i = 1:length(slop)
    v(:,i) = (-floor(l_2/(2*e))*e+mu_y(i):e:floor(l_2/(2*e))*e+mu_y(i));%(-ceil(50/e)*e+mu_y(i):e:ceil(50/e)*e+mu_y(i));
    u(:,i) = slop(i)*(v(:,i)-mu_y(i))+mu_x(i);
end
U1 = e:e:e*length(u);
V1 = e:e:e*length(u(:,1));
[U,V] = meshgrid(U1,V1);
for i=1:length(U)
    ju_x(:,:,i)=floor([U(:,i)+1;U(:,i);U(:,i);U(:,i)+1]);
    ju_y(:,:,i)=floor([V(:,i)+1;V(:,i)+1;V(:,i);V(:,i)]);
end
nu_x_2=permute(reshape(ju_x,length(U(:,1)),4,length(U)),[2,1,3]);%reshape(ju_x,length(u(:,1)), 4)';
nu_y_2=permute(reshape(ju_y,length(U(:,1)),4,length(U)),[2,1,3]);%reshape(ju_y,length(u(:,1)), 4)';
d_2 = ((permute(repmat(U,1,1,4),[3,1,2])) - nu_x_2).^2+((permute(repmat(V,1,1,4),[3,1,2])) - nu_y_2).^2;%(repmat(u(:,i),1,4)' - nu_x_2).^2 + (repmat(v(:,i),1,4)' - nu_y_2).^2;
g=5;
sigma_2 = exp(-g*d_2);
denom_2 = sum(sigma_2);
omega_2 = sigma_2 ./ repmat(denom_2, 4, 1);
Ind_2 = sub2ind(size(I_P), nu_y_2(:), nu_x_2(:));
%u2=u(1:100,:);
%v2=v(1:100,:);
w=permute(sum(omega_2.*reshape(double(I_P(Ind_2)),4,length(u(:,1)),length(u))),[2,3,1]);

%% Overleaf�菇3
% u2=u(1:100,:);u2=u2(:,1:1030);
% v2=v(1:100,:);v2=v2(:,1:1030);
% tempX = [floor(u2(:));ceil(u2(:))];
% tempY = [floor(v2(:));ceil(v2(:))];
% C = unique([tempX tempY],'rows');
% Z = 1/2*ones(600, 1200);
% tempZ=griddata(u2,v2,w,C(:,1),C(:,2),'natural');
% linearInd = sub2ind(size(Z),C(:,2)+251,C(:,1)+50);
% Z(linearInd)=tempZ;
% Z1=isnan(Z);
% find(Z1==1);
% Z(find(Z1==1))=1/2;
end