/*
Crie uma regra uniao(S1,S2,S3) a qual recebe dois conjuntos S1 e S2 e retorna em S3 a uniao de S1 e S2.
*/

pertence(X,[H|T]) :- X =:= H; pertence(X,T). 

uniao([],S,S).
uniao([H|T],S2,[H|S3]) :- \+ pertence(H,S2), uniao(T,S2,S3).
uniao([H|T],S2,S3) :- pertence(H,S2), uniao(T,S2,S3).
