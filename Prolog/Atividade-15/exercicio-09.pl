/*
Crie uma regra xor(X,Y) que receba dois valores booleanos X e Y e indique se a operacao X xor Y eh verdadeira. Construa a regra apenas usando os operadores and, or e not.
*/

xor(X,Y) :- (X, \+ Y); (\+ X, Y).
