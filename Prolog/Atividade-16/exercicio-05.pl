/*
Crie uma regra media(L,X), a qual recebe uma lista L de inteiros e retorna a media de todos os elementos da lista. Note que X eh o resultado da media de todos os elementos de L. Retorne 0 caso a lista for vazia.
*/

soma([],0).
soma([H|T],X) :- soma(T,X1), X is X1 + H.

comprimento([],0).
comprimento([_|T],X) :- comprimento(T,X1), X is X1 + 1.

media([],0).
media(L,X) :- soma(L,S), comprimento(L,C), X is S / C.
