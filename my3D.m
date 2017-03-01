function V = my3D(x, y, z, dz, rho, omega, domega, theta, mu, c, sigma, m, l)
%% equation(5)
norm=zeros(m,length(unique(rho)));%Normal Distribution
for i=1:m
    norm(i,:)=normpdf(unique(rho),(i-1)*mu+c,sigma);
end
phi=zeros(l,length(unique(rho)),2);
for i=1:l
    for j=1:m
        phi(i,:,1)=phi(i,:,1)+theta(i,j,1).*norm(j,:);phi(i,:,2)=phi(i,:,2)+theta(i,j,2).*norm(j,:);
    end
end
%% equation(4)
V=zeros(length(x), length(y), length(z));
for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
            for h=1:l
                V(i,j,k)=V(i,j,k)+phi(h,find(unique(rho)==rho(i,j)),1)*cos(h*(omega(i,j)+k*domega/dz))+phi(h,find(unique(rho)==rho(i,j)),2)*sin(h*(omega(i,j)+k*domega/dz));
            end
        end
    end
end
end
