/*
Crie uma regra posicao(X,L,P) que receba um elemento X, uma lista L e retorne a posicao P do elemento X na lista L.
*/

posicao(X,[X|_],0).
posicao(X,[_|T],P) :- posicao(X,T,PT), P is 1 + PT.  
