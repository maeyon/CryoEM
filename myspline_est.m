function s = myspline_est(tc,tr) %スプライン補間
% tc should be length N+1 in PDF
% 定義 
h = tc(2:end)-tc(1:end-1); % h would be length N in PDF.
i = tr(2:end)-tr(1:end-1);
j = i./h;
%v_1 = tr(3:end)-tr(2:end-1)./h(2:end);
%v_2 = tr(2:end-1)-tr(1:end-2)./h(1:end-1);
v = 6*(j(2:end) - j(1:end-1));  % v would be length N-1 in PDF.

diagH_0 = 2*(h(1:end-1) + h(2:end)); % length N-1 in PDF
N = length(diagH_0); % N-1 in PDF
H = diag(diagH_0);
index = sub2ind([N,N],[1:N-1],[2:N]);
H(index) = h(2:end-1);
index = sub2ind([N,N],[2:N],[1:N-1]);
H(index) = h(2:end-1);

w = inv(H)*v(:);
u = [0 ; w(:) ; 0];
a = diag((u(2:end) - u(1:end-1))./(6*h));
b = u(1:end-1) / 2;
c = diag(j - h(1:end).*(2*u(1:end-1)+u(2:end))/6);
d = tr(1:end-1);
s = [a(:) b(:) c(:) d(:)];
end
