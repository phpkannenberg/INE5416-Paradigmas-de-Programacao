/*
Crie uma regra absoluto(N,X) que receba um numero N, negativo ou positivo, e retorne seu valor absoluto X.
*/

absoluto(N,X) :- (N >= 0), X is N.
absoluto(N,X) :- (N < 0), X is -N.
