/*
Crie uma regra soma(L,X), a qual recebe uma lista L de inteiros e retorna a soma de todos os elementos da lista. Note que X eh o resultado da soma de todos os elementos de L. Retorne 0 caso a lista for vazia.
*/

soma([],0).
soma([H|T],X) :- soma(T,X1), X is X1 + H.


