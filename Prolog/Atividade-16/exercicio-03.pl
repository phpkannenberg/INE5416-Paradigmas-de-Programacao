/*
Crie uma regra numerosParaPalavras(L1,L2) que receba uma lista L1 contendo os numeros de 0 a 9 e retorne uma lista L2 que contenha a mesma lista de numeros de 0 ate 9, mas escritos como palavras.
*/

numerosParaPalavras([],[]).
numerosParaPalavras([0|T],["Zero"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([1|T],["Um"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([2|T],["Dois"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([3|T],["Tres"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([4|T],["Quatro"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([5|T],["Cinco"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([6|T],["Seis"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([7|T],["Sete"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([8|T],["Oito"|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([9|T],["Nove"|T2]) :- numerosParaPalavras(T,T2).
