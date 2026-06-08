/*
Crie uma regra fib(N,K) que compute o n-esimo numero de Fibonacci K.
*/

fib(0, 0).
fib(1, 1).
fib(N, K) :- N >= 2, N1 is N - 1, N2 is N - 2, fib(N1, K1), fib(N2, K2), K is K1 + K2.
