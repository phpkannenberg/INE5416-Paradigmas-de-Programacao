{-
Crie uma funcao com assinatura media :: [Int] -> Float, a qual recebe uma lista de Int e retorna a media de todos os elementos da lista. Retorne 0 caso a lista for vazia. 
DICA: utilize a funcao fromIntegral para converter um tipo inteiro para um tipo compativel com o operador de divisao /. 
-}

soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + (soma b)

tamanho :: [Int] -> Int
tamanho [] = 0
tamanho (a:b) = 1 + (tamanho b)

media :: [Int] -> Float
media [] = 0
media lista = fromIntegral (soma lista) / fromIntegral (tamanho lista)

main = do
  print (media [1..10])
  print (media [1..5])
