function [mu_x, mu_y, u, v] = myplot(Tx,dx, dy, e, s, tc, n) %ä‘äueÇ≤Ç∆ÇÃÉvÉçÉbÉg
d = cumsum(sqrt(dx^2 + dy.^2));
mu_x = interp1(d,Tx(2:end),(1:n)*e);
mu_y = myspline(mu_x,s,tc);
grad=-dy/dx;
for i=1:length(mu_x)-1
    slop(i)=grad(find(abs(Tx-mu_x(i))==min(abs(Tx - mu_x(i)))));
end
v = zeros(2*ceil(100/e)+1, length(slop));%v = zeros(length(slop), 2*ceil(100/e)+1);
u = zeros(2*ceil(100/e)+1, length(slop));%u = zeros(length(slop), 2*ceil(100/e)+1);
for i = 1:length(slop)
    v(:,i) = (-ceil(100/e)*e+mu_y(i):e:ceil(100/e)*e+mu_y(i));
    u(:,i) = slop(i)*(v(:,i)-mu_y(i))+mu_x(i);
end
end