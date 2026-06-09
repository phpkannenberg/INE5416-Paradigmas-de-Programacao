/*
Crie uma regra apagar(N,L1,L2), a qual recebe um numero de elementos N, uma lista N1, e retorna uma lista L2. Esta funcao deve remover da lista os N primeiros elementos fornecidos como parametro.
*/

apagar(0,L,L).
apagar(N,[_|T],L2) :- N1 is N - 1, apagar(N1,T,L2).
