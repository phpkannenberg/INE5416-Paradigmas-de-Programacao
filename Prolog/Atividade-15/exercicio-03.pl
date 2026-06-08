/*
Crie uma regra divisivel(N,K) para dizer se um numero N eh divisivel por K.
*/
 
divisivel(N, K) :- K \= 0, N mod K =:= 0.
