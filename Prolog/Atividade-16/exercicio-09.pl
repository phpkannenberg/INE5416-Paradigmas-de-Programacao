/*
Crie uma regra ocorrencias(L,X,N), a qual recebe uma lista L, um elemento X e retorna o numero de vezes N em que o elemento esta presente na lista.
*/

ocorrencias([],_,0).
ocorrencias([X|T],X,N) :- ocorrencias(T,X,NT), N is NT + 1.
ocorrencias([H|T],X,N) :- H =\= X, ocorrencias(T,X,N).
