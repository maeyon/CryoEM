function Ty = myspline(Tx,s,tc) %ƒXƒvƒ‰ƒCƒ“•âŠÔ
a = s(:,1);
b = s(:,2);
c = s(:,3);
d = s(:,4);
Ty = zeros(size(Tx));
for j = 1 : length(tc)-1
    index = find((Tx >= tc(j)).*(Tx <= tc(j+1)));
    Ty(index) =  a(j)*(Tx(index) - tc(j)).^3 + b(j)*(Tx(index) - tc(j)).^2 + c(j)*(Tx(index) - tc(j)) + d(j);
end
end