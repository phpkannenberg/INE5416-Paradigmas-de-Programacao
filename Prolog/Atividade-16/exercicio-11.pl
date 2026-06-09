/*
Crie uma regra primeiros(N,L1,L2), a qual recebe um numero de elementos N, uma lista L1, e retorna uma lista L2. Esta funcao deve retornar uma lista com os N primeiros elementos informados no primeiro parametro.
*/

primeiros(0,_,[]).
primeiros(N,[H|T],[H|L2]) :- N1 is N - 1, primeiros(N1,T,L2). 
