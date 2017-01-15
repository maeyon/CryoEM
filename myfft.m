function [B, f] = myfft(mu_z,n,l) %ƒt[ƒŠƒG•ÏŠ·
F = n/l;
Mu = fft(mu_z);
B2 = abs(Mu/n);
B = B2(1:n/2+1);
B(2:end-1) = 2*B(2:end-1);
f = F*(0:(n/2))/n;
end
