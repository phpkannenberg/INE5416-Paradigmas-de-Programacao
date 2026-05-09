{-
Crie uma funcao com assinatura ocorrencias :: [Int] -> Int -> Int, a qual recebe uma lista de Int e um Int e retorna o numero de vezes em que o elemento esta presente na lista.
-}

ocorrencias :: [Int] -> Int -> Int
ocorrencias [] _ = 0
ocorrencias (a:b) x
  | (a == x) = 1 + (ocorrencias b x)
  | otherwise = (ocorrencias b x)

main = do
  print (ocorrencias [1..10] 1)
  print (ocorrencias [1,2,3,3,2,1,1,2,3] 1)
  print (ocorrencias [] 1)
