X = 0.1:0.1:20
A = 0.001
B = 1 / A
Y = gampdf(X,A,B)
plot(X,Y)