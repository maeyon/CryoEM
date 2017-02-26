function I_D = mydiscrete(I_C)
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
I_D=;
end