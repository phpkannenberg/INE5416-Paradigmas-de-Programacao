/*
Crie uma regra palindrome(L), a qual recebe uma lista L e retorna se ela eh um palindrome. Uma lista eh uma palindrome se os itens da esquerda para a direita estao na mesma ordem da direita para a esquerda.
*/

concatena([],L,L).
concatena([H|T],L2,[H|L3]) :- concatena(T,L2,L3).

inverte([],[]).
inverte([H|T],L2) :- inverte(T,LT), concatena(LT,[H],L2).

igual(L,L).

palindrome([]).
palindrome(L1) :- inverte(L1, L2), igual(L1,L2).
