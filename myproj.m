function I_P=myproj(V)
I_P = permute(sum(V, 3),[2,1,3]);%w�����Ɏˉe%I_P = permute(sum(I, 2),[3,1,2]);%v�����Ɏˉe
%I_P_noise = I_P + 2*randn(size(I_P));