/*
Modifique o arquivo familia.pl de forma a incluir as seguintes regras:
tio(X,Y)
tia(X,Y)
primo(X,Y)
prima(X,Y)
primos(X,Y)
bisavo(X,Y)
bisavoh(X,Y)
descendente(X,Y)
feliz(X), onde X eh feliz se possui filhos
*/

genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(pat, jim).

mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).
homem(tom).
homem(bob).
homem(jim).
homem(bill).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), mulher(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo

tio(X,Y) :- irmao(X,Z), (genitor(Z,Y)).
tia(X,Y) :- irma(X,Z), (genitor(Z,Y)).

primo(X,Y) :- primos(X,Y), homem(X).
prima(X,Y) :- primos(X,Y), mulher(X).
primos(X,Y) :- genitor(GenitorX, X), genitor(GenitorY, Y), irmaos(GenitorX, GenitorY), X \== Y.

bisavo(X,Y) :- pai(X,W), genitor(W,Z), genitor(Z,Y).
bisavoh(X,Y) :- mae(X,W), genitor(W,Z), genitor(Z,Y).

descendente(X,Y) :- ascendente(Y,X).

feliz(X) :- genitor(X,_).
