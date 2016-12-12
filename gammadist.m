X = 0.01:0.01:20
A = 0.0001
B = 1 / A
Y = gampdf(X,A,B)
plot(X,Y)