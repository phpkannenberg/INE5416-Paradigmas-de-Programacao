/*
Crie uma regra inserirElementoPosicao(X,P,L1,L2) que receba um elemento X, uma posicao P, e uma lista L1 e retorne uma lista L2 onde X eh inserido na posicao P.
*/

inserirElementoPosicao(X,0,L1,[X|L1]).
inserirElementoPosicao(X,P,[H|T],[H|T2]) :- 
	P1 is P - 1, 
	inserirElementoPosicao(X,P1,T,T2).
