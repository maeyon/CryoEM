%ŠÔŠue‚²‚Æ‚Ìƒvƒƒbƒg
function mu = myplot(Tx,Ty, e, s, tc)
d = cumsum(sqrt(1+diff(Ty).^2));
A = interp1(d,Tx(2:end),[1:100]*e);
mu = [A ; myspline(A,s,tc)];