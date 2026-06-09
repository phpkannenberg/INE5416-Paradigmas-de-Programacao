/*
Crie uma regra inverte(L1,L2), a qual recebe uma lista L1 como parametro e deve retornar a mesma invertida L2.
*/

concatena([],L,L).
concatena([H|T],L2,[H|L3]) :- concatena(T,L2,L3).

inverte([],[]).
inverte([H|T],L2) :- inverte(T,LT), concatena(LT,[H],L2).
