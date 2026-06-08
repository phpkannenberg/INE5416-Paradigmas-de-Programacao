/*
Crie uma regra mdc(X,Y,Resultado) que receba dois numeros X e Y e retorne o maximo divisor comum.
*/

mdc(0,Y,Resultado) :- Y >= 0, Resultado is Y.
mdc(X,0,Resultado) :- X >= 0, Resultado is X.
mdc(X,Y,Resultado) :- X >= 0, 
		      Y >= 0, 
		      ((X == Y, Resultado is X);
		       (X > Y, X1 is X - Y, mdc(X1, Y, R), Resultado is R);
		       (X < Y, Y1 is Y - X, mdc(X, Y1, R), Resultado is R)).
