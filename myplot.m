function [mu_x, mu_y] = myplot(Tx,dx, dy, e, s, tc, n) %ŠÔŠue‚²‚Æ‚Ìƒvƒƒbƒg
d = cumsum(sqrt(dx^2 + dy.^2));
mu_x = interp1(d,Tx(2:end),[1:n]*e);
mu_y = myspline(mu_x,s,tc);
end