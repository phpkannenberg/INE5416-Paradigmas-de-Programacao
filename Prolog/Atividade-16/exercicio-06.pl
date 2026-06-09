/*
Crie uma regra menor(L,X), a qual recebe uma lista L de inteiros e retorna o menor elemento da lista. Note que X eh o menor elemento de L. Retorne 0 caso a lista for vazia.
*/

menor([],0).
menor([X],X).
menor([X1,X2|T],X3) :- (X1 =< X2, menor([X1|T],X3)); (X2 < X1, menor([X2|T],X3)).
