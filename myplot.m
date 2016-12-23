%ŠÔŠue‚²‚Æ‚Ìƒvƒƒbƒg
function mu = myplot(Tx,Ty, e, s, tc)

d = cumsum(sqrt(1+diff(Ty).^2));
% for i = 1:10000
%     d(i) = sum(sqrt(1+diff(Ty(1:i)).^2))
% end

A = interp1(d,Tx(2:end),[1:100]*e);
mu = [A myspline(A,s,tc)];
% for j = 1:100
%     A(j) = find(d==j*e)
% end
% 
% mu = [Tx(A) ; Ty(A)];