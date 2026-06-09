/*
Crie uma regra diferenca(S1,S2,S3) a qual recebe dois conjuntos S1 e S2 e retorna em S3 a diferenca de S1 e S2.
*/

pertence(X,[H|T]) :- X =:= H; pertence(X,T). 

diferenca([],_,[]).
diferenca([H|T],S2,[H|S4]) :- \+ pertence(H,S2), diferenca(T,S2,S4).
diferenca([H|T],S2,S3) :- pertence(H,S2), diferenca(T,S2,S3).
