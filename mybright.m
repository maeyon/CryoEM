%‹P“x’l‚Ì„’è
function mu = mybright(y, mu_x, mu_y, g)

%—×Ú‚·‚é4‚Â‚Ì‰æ‘f‚ğŒ©‚Â‚¯‚é
nu_x = floor([mu_x+1 ; mu_x ; mu_x ; mu_x+1]);
nu_y = floor([mu_y+1 ; mu_y+1 ; mu_y ; mu_y]);
nu = [nu_x(:) nu_y(:)];
 
%‹P“x’l‚Ì„’è
d = (repmat(mu_x,4,1) - nu_x).^2 + (repmat(mu_y,4,1) - nu_y).^2;
sigma = exp(-g*d);
denom = sum(sigma);
omega = sigma ./ repmat(denom, 4, 1);
mu_z = sum(omega .* y(nu))
mu = [mu_x mu_y mu_z];
end