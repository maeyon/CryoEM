function [B, f] = myfft(mu_z,n,l) %�t�[���G�ϊ�
F=n/l;
Mu=fft(mu_z);
B2=abs(Mu/n);
B=B2(2:ceil(n/2+1));%B2(1:ceil(n/2+1));%�ŏ��̍���Error�̌��Ȃ̂ŏ��O����
B(2:end-1)=2*B(2:end-1);
f=F*(1:ceil(n/2))/n;
end
