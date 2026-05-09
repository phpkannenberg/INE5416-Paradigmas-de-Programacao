{-
Crie uma funcao com assinatura menor :: [Int] -> Int, a qual recebe uma lista de Int e retorna o menor elemento da lista. Retorne 0 caso a lista for vazia.
-}

menor :: [Int] -> Int
menor [] = 0
menor [a] = a
menor (a:b)
  | a < m = a
  | otherwise = m
  where m = menor b

main = do
  print (menor [2, 4, 3, 1, 6, 5])
  print (menor [])
