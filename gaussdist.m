mu = [0 0];
a = sqrt(200)
Sigma = [a 0; 0 a];
x1 = -20:.5:20; x2 = -20:.5:20;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-20 20 -20 20 0 .015])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');