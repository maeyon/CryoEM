%ŠÔŠue‚²‚Æ‚Ìƒvƒƒbƒg
function [mu_x, mu_y] = myplot(Tx,Ty, e, s, tc)
d = cumsum(sqrt(1+diff(Ty).^2));
mu_x = interp1(d,Tx(2:end),[1:100]*e);
mu_y = myspline(mu_x,s,tc);
end