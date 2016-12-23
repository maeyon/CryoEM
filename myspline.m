%ƒXƒvƒ‰ƒCƒ“•âŠÔ (in: t, out:a)
%s = (a, b, c, d)
function Ty = myspline(Tx,s,tc)

a = s(:,1);
b = s(:,2);
c = s(:,3);
d = s(:,4);
Ty = zeros(size(Tx));
for j = 1 : length(tc)-1
    index = find((Tx >= tc(j)).*(Tx <= tc(j+1)));
    Ty(index) =  a(j)*(Tx(index) - tc(j)).^3 + b(j)*(Tx(index) - tc(j)).^2 + c(j)*(Tx(index) - tc(j)) + d(j);
%     if Tx >= tc(j) && Tx <= tc(j+1)
%         Ty(1:10000) = a(j)*(Tx(1:10000) - tc(j))^3 + b(j)*(Tx(1:10000) - tc(j))^2 + c(j)*(Tx(1:10000) - tc(j)) + d(j);
%     end
end
end