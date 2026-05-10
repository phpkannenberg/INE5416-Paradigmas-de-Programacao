{-
Modifique o arquivo arvore.hs de forma a adicionar novas operacoes a nossa arvore:
A: Crie uma funcao com a seguinte assinatura ocorrenciasElemento :: Arvore -> Int -> Int, a qual recebe um numero e deve retornar a quantidade de ocorrencias dele na arvore.
B: Crie uma funcao com a seguinte assinatura maioresQueElemento :: Arvore -> Int -> Int, a qual recebe um numero e deve retornar a quantidade de numeros maiores que ele na arvore.
C: Crie uma funcao com a seguinte assinatura mediaElementos :: Arvore -> Float, a qual deve retornar a media dos numeros na arvore.
D: Crie uma funcao com a seguinte assinatura quantidade :: Arvore -> Int, a qual deve retornar a quantidade de elementos da arvore.
E: Crie uma funcao com a seguinte assinatura elementos :: Arvore -> [Int], a qual deve retornar uma lista com todos os elementos na arvore.
-}

data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 32 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x 
    | (n == x) = True                           
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup 
minimoElemento (No n esq dir) = 
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))

ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) alvo
  | n == alvo = 1 + (ocorrenciasElemento esq alvo) + (ocorrenciasElemento dir alvo)
  | otherwise = (ocorrenciasElemento esq alvo) + (ocorrenciasElemento dir alvo)

maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) alvo
  | n > alvo = 1 + (maioresQueElemento esq alvo) + (maioresQueElemento dir alvo)
  | otherwise = (maioresQueElemento esq alvo) + (maioresQueElemento dir alvo)

mediaElementos :: Arvore -> Float
mediaElementos Null = 0
mediaElementos a = fromIntegral (somaElementos a) / fromIntegral (quantidade a)

quantidade :: Arvore -> Int
quantidade Null = 0
quantidade (No _ esq dir) = 1 + (quantidade esq) + (quantidade dir)

elementos :: Arvore -> [Int]
elementos Null = []
elementos (No n esq dir) = n : ((elementos esq) ++ (elementos dir))

main = do putStrLn (show (somaElementos minhaArvore))
          putStrLn (show (buscaElemento minhaArvore 30))
          putStrLn (show (buscaElemento minhaArvore 55))
          putStrLn (show (minimoElemento minhaArvore))
          putStrLn (show (ocorrenciasElemento minhaArvore 52))
          putStrLn (show (maioresQueElemento minhaArvore 52))
          putStrLn (show (quantidade minhaArvore))
          putStrLn (show (mediaElementos minhaArvore))
          putStrLn (show (elementos minhaArvore))
          
