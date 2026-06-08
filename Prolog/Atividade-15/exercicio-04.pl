/*
Crie uma regra triangulo(X, Y, Z) que receba tres valores X, Y e Z e indique se havendo varetas com esses valores em comprimento pode-se construir um triangulo.
*/

triangulo(X, Y, Z) :- (X + Y > Z), (X + Z > Y), (Y + Z > X).
