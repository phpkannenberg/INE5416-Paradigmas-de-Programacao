% =========================================================================
% RESOLVEDOR WOLKENKRATZER
% =========================================================================

% predicado principal para backtracking celula a celula
resolve(Grid, Top, Bottom, Left, Right, DiagAtiva, MaxHeight) :-
    tamanho_lista(Grid, N),
    gerar_elementos_disponiveis(MaxHeight, N, Elementos),
    gerar_linhas_disponiveis(N, Elementos, DispLinhas),
    resolver_celulas(0, 0, N, Grid, DispLinhas, Top, Bottom, Left, Right, DiagAtiva).

% gera lista com elementos a ser usados em cada linha/coluna/diagonal (inclui 0's)
gerar_elementos_disponiveis(Max, N, Elementos) :-
    gerar_sequencia(Max, Seq),
    ContagemZeros is N - Max,
    gerar_zeros(ContagemZeros, Zeros),
    concatenar(Seq, Zeros, Elementos).

% gera lista com sequencia de 1 a N
gerar_sequencia(0, []) :- !.
gerar_sequencia(N, [N|Resto]) :- N > 0, N1 is N - 1, gerar_sequencia(N1, Resto).

% gera lista com N 0's
gerar_zeros(0, []) :- !.
gerar_zeros(N, [0|Resto]) :- N > 0, N1 is N - 1, gerar_zeros(N1, Resto).

% retorna elementos disponiveis para cada linha do grid
gerar_linhas_disponiveis(0, _, []) :- !.
gerar_linhas_disponiveis(N, Elems, [Elems|Resto]) :-
    N > 0, N1 is N - 1,
    gerar_linhas_disponiveis(N1, Elems, Resto).

% chegou ao fim (tabuleiro totalmente preenchido): valida visibilidade das colunas e diagonais
resolver_celulas(N, 0, N, Grid, _, Top, Bottom, [], [], DiagAtiva) :- !,
    transposta(Grid, Colunas),
    validar_colunas_dicas(Colunas, Top, Bottom),
    validar_diagonais(Grid, N, DiagAtiva).
    
% fim de linha: valida visibilidade da linha (left, right) e desce uma linha
resolver_celulas(I, N, N, Grid, DispLinhas, Top, Bottom, [L|RestoLeft], [R|RestoRight], DiagAtiva) :- !,
    obter_elemento_indice(I, Grid, Linha),
    validar_visibilidade(Linha, L),
    inverter_lista(Linha, LinhaInvertida),
    validar_visibilidade(LinhaInvertida, R),
    I1 is I + 1,
    resolver_celulas(I1, 0, N, Grid, DispLinhas, Top, Bottom, RestoLeft, RestoRight, DiagAtiva).

% preenche celula (i,j):
% 1. localiza celula atual
% 2. localiza lista de elementos disponivel para a i-esima linha
% 3. escolhe e consome um elemento disponivel para a i-esima linha
% 4. valida coluna com base no que ja foi preenchido ate o momento (early failure)
resolver_celulas(I, J, N, Grid, DispLinhas, Top, Bottom, Left, Right, DiagAtiva) :-
    J < N,
    % 1.
    obter_elemento_indice(I, Grid, Linha),
    obter_elemento_indice(J, Linha, X),
    % 2.
    obter_elemento_indice(I, DispLinhas, DispAtual),
    % 3.
    remover_elemento(X, DispAtual, NovoDispAtual),
    substituir_indice(I, NovoDispAtual, DispLinhas, NovasDispLinhas),
    % 4.
    extrair_coluna_ate(Grid, I, J, ElementosAcima),
    (X =:= 0 -> true ; \+ elemento_existe(X, ElementosAcima)),
    J1 is J + 1,
    resolver_celulas(I, J1, N, Grid, NovasDispLinhas, Top, Bottom, Left, Right, DiagAtiva).

% retorna todos os elementos verticalmente acima da celula (i,j)
extrair_coluna_ate(_, 0, _, []) :- !.
extrair_coluna_ate(Grid, I, J, [X|Resto]) :-
    I > 0, I1 is I - 1,
    obter_elemento_indice(I1, Grid, Linha),
    obter_elemento_indice(J, Linha, X),
    extrair_coluna_ate(Grid, I1, J, Resto).

% retorna verdadeiro se todas as colunas sao validas (matriz de entrada foi transposta)
validar_colunas_dicas([], [], []).
validar_colunas_dicas([Col|RestoCols], [T|RestoTop], [B|RestoBottom]) :-
    validar_visibilidade(Col, T),
    inverter_lista(Col, ColInvertida),
    validar_visibilidade(ColInvertida, B),
    validar_colunas_dicas(RestoCols, RestoTop, RestoBottom).

% retorna verdadeiro se torres visiveis equivalem a dica
validar_visibilidade(_, Dica) :- var(Dica), !.  % verifica se dica eh uma variavel livre
validar_visibilidade(Linha, Dica) :-
    nonvar(Dica),
    contar_visiveis(Linha, 0, 0, Contagem),
    Dica =:= Contagem.

% retorna numero de torres visiveis em uma lista (linha ou coluna)
contar_visiveis([], _, Acc, Acc).
contar_visiveis([H|T], Maior, Acc, Total) :-
    H > 0, H > Maior, !,  % corte impede chamada da terceira clausula por engano
    NovoAcc is Acc + 1,
    contar_visiveis(T, H, NovoAcc, Total).
contar_visiveis([_|T], Maior, Acc, Total) :-
    contar_visiveis(T, Maior, Acc, Total).

% retorna verdadeiro caso diagonal principal e secundaria nao possuem duplicados (com excessao do zero)
validar_diagonais(_, _, nao) :- !.
validar_diagonais(Grid, _, sim) :-
    extrair_diagonal(Grid, 0, DiagPrincipal),
    sem_duplicados_sem_zero(DiagPrincipal),
    inverter_linhas_matriz(Grid, GridInvertido),
    extrair_diagonal(GridInvertido, 0, DiagSecundaria),
    sem_duplicados_sem_zero(DiagSecundaria).

% retorna verdadeiro caso elementos diferentes de 0 aparecem uma unica vez na lista
sem_duplicados_sem_zero([]).
sem_duplicados_sem_zero([X|Xs]) :-
    (X =:= 0 -> true ; \+ elemento_existe(X, Xs)),
    sem_duplicados_sem_zero(Xs).

% retorna lista com todos elementos na diagonal principal
extrair_diagonal([], _, []).
extrair_diagonal([Linha|Resto], Indice, [X|Diag]) :-
    obter_elemento_indice(Indice, Linha, X),
    Proximo is Indice + 1,
    extrair_diagonal(Resto, Proximo, Diag).

% retorna matriz com todas as linhas invertidas
inverter_linhas_matriz([], []).
inverter_linhas_matriz([L|Ls], [R|Rs]) :-
    inverter_lista(L, R),
    inverter_linhas_matriz(Ls, Rs).

% =========================================================================
% FUNÇÕES UTILITÁRIAS DE MANIPULAÇÃO DE LISTAS
% =========================================================================

% retorna o tamanho da lista
tamanho_lista([], 0).
tamanho_lista([_|T], N) :- tamanho_lista(T, N1), N is N1 + 1.

% retorna a concatenacao de duas listas
concatenar([], L, L).
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).

% retorna uma lista invertida (primeiro vira ultimo e vice versa)
inverter_lista(Lista, Invertida) :- inverter_aux(Lista, [], Invertida).
inverter_aux([], Acc, Acc).
inverter_aux([H|T], Acc, R) :- inverter_aux(T, [H|Acc], R).

% retorna verdadeiro se X eh um elemento da lista
elemento_existe(X, [X|_]) :- !.
elemento_existe(X, [_|T]) :- elemento_existe(X, T).

% retorna lista com primeira instancia do elemento X removida
remover_elemento(X, [X|T], T).
remover_elemento(X, [H|T], [H|R]) :- remover_elemento(X, T, R).

% retorna o i-esimo termo da lista
obter_elemento_indice(0, [X|_], X) :- !.
obter_elemento_indice(I, [_|T], X) :- I > 0, I1 is I - 1, obter_elemento_indice(I1, T, X).

% substitui o i-esimo termo da lista por NovoX
substituir_indice(0, NovoX, [_|T], [NovoX|T]) :- !.
substituir_indice(I, NovoX, [H|T], [H|R]) :-
    I > 0, I1 is I - 1,
    substituir_indice(I1, NovoX, T, R).

% retorna a matriz transposta (linha vira coluna e vice versa)
transposta([], []).
transposta([[]|_], []) :- !.
transposta(Matriz, [Col|Cols]) :-
    extrair_primeira_coluna(Matriz, Col, RestoMatriz),
    transposta(RestoMatriz, Cols).

% retorna lista com elementos da primeira coluna da matriz
extrair_primeira_coluna([], [], []).
extrair_primeira_coluna([[X|Xs]|Resto], [X|Col], [Xs|RestoMatriz]) :-
    extrair_primeira_coluna(Resto, Col, RestoMatriz).

% =========================================================================
% EXEMPLOS DE CASO DE TESTE
% =========================================================================

% Nr. 3 (janko.at)
teste_completo(Grid) :-
    Grid = [
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_]
    ],
    resolve(Grid, 
            [4,1,2,2,3,2], 
            [1,3,5,2,4,2], 
            [2,3,3,4,2,1], 
            [2,4,2,3,1,4], 
            nao, 6).

% Beispiel (janko.at)
teste_completo_parques(Grid) :-
    Grid = [
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_]
    ],
    resolve(Grid, 
            [3,3,1,2,1,3], 
            [2,1,4,3,5,3], 
            [4,3,3,3,1,2], 
            [2,2,2,1,2,2], 
            nao, 5).

% Nr. 286 (janko.at)
teste_completo_parques_diagonal(Grid) :-
    Grid = [
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_]
    ],
    resolve(Grid, 
            [2,1,2,3,2,3], 
            [2,3,2,1,3,2], 
            [2,4,2,1,2,4], 
            [3,2,2,3,1,2], 
            sim, 5).

% Nr. 448 (janko.at)
teste_incompleto(Grid) :-
    Grid = [
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_],
        [_,_,_,_,_,_]
    ],
    resolve(Grid, 
            [_,_,4,2,1,2], 
            [3,3,_,2,3,2], 
            [_,2,1,2,_,_], 
            [2,3,6,4,1,4], 
            nao, 6).
            

