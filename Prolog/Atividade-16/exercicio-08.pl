/*
Crie uma regra diferencaMaiorMenor(L,X), a qual recebe uma lista L de inteiros e retorna a diferenca entre o maior e o menor elemento da lista. Note que X eh o resultado. Retorne 0 caso a lista for vazia.
*/

menor([],0).
menor([X],X).
menor([X1,X2|T],X3) :- (X1 =< X2, menor([X1|T],X3)); (X2 < X1, menor([X2|T],X3)).

maior([],0).
maior([X],X).
maior([X1,X2|T],X3) :- (X1 >= X2, maior([X1|T],X3)); (X2 > X1, maior([X2|T],X3)).

diferencaMaiorMenor(L,X) :- maior(L,Maior), menor(L,Menor), X is Maior - Menor.
