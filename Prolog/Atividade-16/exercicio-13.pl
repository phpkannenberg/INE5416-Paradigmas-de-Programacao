/*
Crie uma lista dividir(L1,L2,L3), a qual recebe uma lista como entrada L1 e deve dividi-la em duas listas L2 e L3 com a mesma quantidade de elementos (exceto quando L1 tiver quantidade impar).
*/

comprimento([],0).
comprimento([_|T],X) :- comprimento(T,X1), X is X1 + 1.

primeiros(0,_,[]).
primeiros(N,[H|T],[H|L2]) :- N1 is N - 1, primeiros(N1,T,L2).

apagar(0,L,L).
apagar(N,[_|T],L2) :- N1 is N - 1, apagar(N1,T,L2).

dividir(L1,L2,L3) :- 
	comprimento(L1,X), 
	CompL2 is X - (X // 2), 
	primeiros(CompL2,L1,L2), 
	apagar(CompL2,L1,L3).
