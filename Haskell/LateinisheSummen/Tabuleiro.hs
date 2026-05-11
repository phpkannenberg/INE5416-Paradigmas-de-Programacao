module Tabuleiro where

-- posicao no tabuleiro eh representada por uma dupla ordenada
type Posicao = (Int, Int)

-- toda celula possui uma cor e um inteiro
-- deriva de Eq para testar igualdade (==)
data Celula = Preta Int | Branca Int
  deriving (Eq)
  
-- celula herda de Show (converter para string)
instance Show Celula where
  show (Preta n) = "[" ++ show n ++ "]"
  show (Branca n) = if n == 0 then " . "
                    else " " ++ show n ++ " "

-- tabuleiro eh uma matriz de celulas
type Tabuleiro = [[Celula]]

tamanhoTabuleiro :: Int
tamanhoTabuleiro = 8

-- retorna celula em uma determinada posicao
getCelula :: Tabuleiro -> Posicao -> Celula
getCelula tabuleiro (linha, coluna) = (tabuleiro !! linha) !! coluna

-- substitui conteudo do n-esimo termo de uma lista
substituirNaPosicao :: Int -> a -> [a] -> [a]
substituirNaPosicao 0 novo (_:b) = novo : b
substituirNaPosicao pos novo (a:b) = a : (substituirNaPosicao (pos - 1) novo b)

-- retorna novo tabuleiro com com valor atualizado de uma celula especificada
setCelula :: Tabuleiro -> Posicao -> Celula -> Tabuleiro
setCelula tab (linha, coluna) valor = 
  substituirNaPosicao linha (substituirNaPosicao coluna valor (tab !! linha)) tab

ehPreta :: Celula -> Bool
ehPreta (Preta _) = True
ehPreta _ = False

-- impressao recursiva das celulas de uma linha (celula por celula)
imprimirLinha :: [Celula] -> IO ()
imprimirLinha [] = putStrLn ""
imprimirLinha (a:b) = do
  putStr (show a)
  imprimirLinha b

-- impressao recursiva do tabuleiro (linha por linha)
imprimirTabuleiro :: Tabuleiro -> IO ()
imprimirTabuleiro [] = putStrLn ""
imprimirTabuleiro (linha:linhas) = do
  imprimirLinha linha
  imprimirTabuleiro linhas
  
-- checagem dos limites do tabuleiro (de acordo com tamanho pre definido)
posicaoValida :: Posicao -> Bool
posicaoValida (linha, coluna) = linha >= 0 && linha < tamanhoTabuleiro &&
                                coluna >= 0 && coluna < tamanhoTabuleiro

-- retorna lista das posicoes adjacentes a uma posicao valida
posicoesAdjacentes :: Posicao -> [Posicao]
posicoesAdjacentes (linha, coluna) = [ 
                                     (linha + x, coluna + y)
                                     | x <- [-1..1]
                                     , y <- [-1..1]
                                     , (x /= 0 || y /= 0)
                                     , posicaoValida (linha + x, coluna + y)
                                     ]

-- retorna os valores ja inseridos (nas celulas brancas) em uma linha do tabuleiro
valoresLinha :: Tabuleiro -> Int -> [Int]
valoresLinha tab linha = [n | Branca n <- tab !! linha, n /= 0]

-- retorna os valores ja inseridos (nas celulas brancas) em uma coluna do tabuleiro
valoresColuna :: Tabuleiro -> Int -> [Int]
valoresColuna tab coluna = [n | linha <- tab, Branca n <- [linha !! coluna], n /= 0]

-- verifica se ha valores repetidos (duplicados) em uma lista (representando uma linha / coluna)
haDuplicatas :: [Int] -> Bool
haDuplicatas [] = False
haDuplicatas (a:b) = (elem a b) || (haDuplicatas b)

-- verifica se ha valores duplicados numa linha
linhaValida :: Tabuleiro -> Int -> Bool
linhaValida tab linha = not (haDuplicatas (valoresLinha tab linha))

-- verifica se ha valores duplicados numa coluna
colunaValida :: Tabuleiro -> Int -> Bool
colunaValida tab coluna = not (haDuplicatas (valoresColuna tab coluna))

-- retorna lista com os valores inseridos em celulas brancas adjacentes a uma posicao
valoresBrancasAdjacentes :: Tabuleiro -> Posicao -> [Int]
valoresBrancasAdjacentes tab pos = [
                                   n 
                                   | p <- posicoesAdjacentes pos, 
                                   Branca n <- [getCelula tab p], 
                                   n /= 0
                                   ]

-- retorna quantidade de celulas brancas adjacentes a uma posicao
quantidadeBrancasAdjacentes :: Tabuleiro -> Posicao -> Int
quantidadeBrancasAdjacentes tab pos = length [ 
                                             p
                                             | p <- posicoesAdjacentes pos 
                                             , Branca _ <- [getCelula tab p]
                                             ]
                                             
-- verifica se as adjacencias de uma celula preta sao validas. dois casos:
-- a) todas as celulas brancas adjacentes foram preenchidas: soma deve ser igual ao conteudo da celula preta
-- b) alguma celula branca adjacente nao foi preenchida: soma deve ser menor que o conteudo da celula preta
celulaPretaValida :: Tabuleiro -> Posicao -> Bool
celulaPretaValida tab pos = validar celula
  where celula = getCelula tab pos
        valores = valoresBrancasAdjacentes tab pos
        parcial = sum valores
        totalAdj = quantidadeBrancasAdjacentes tab pos
        preenchidas = length valores
        validar (Preta objetivo) | (preenchidas == totalAdj) = parcial == objetivo
                                 | otherwise = parcial <= objetivo
        validar _ = True
        
-- verifica se todas as celulas pretas do tabuleiro sao validas (i.e., se nenhuma regra foi infrigida ate o momento)
todasPretasValidas :: Tabuleiro -> Bool
todasPretasValidas tab = and [
                         celulaPretaValida tab (linha, coluna)
                         | linha <- [0..tamanhoTabuleiro - 1]
                         , coluna <- [0..tamanhoTabuleiro - 1]
                         , ehPreta (getCelula tab (linha, coluna))
                         ]

-- testa uma nova jogada (i.e., um chute no backtracking)
jogadaValida :: Tabuleiro -> Posicao -> Int -> Bool
jogadaValida tab (linha, coluna) n = linhaValida novoTab linha
                                     && colunaValida novoTab coluna
                                     && pretasVizinhasValidas
  where novoTab = setCelula tab (linha, coluna) (Branca n)
        vizinhos = posicoesAdjacentes (linha, coluna)
        pretasVizinhasValidas = all (celulaPretaValida novoTab) [
                                                                p 
                                                                | p <- vizinhos
                                                                , ehPreta (getCelula novoTab p)
                                                                ]
