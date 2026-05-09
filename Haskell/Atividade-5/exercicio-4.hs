{-
Crie uma funcao com assinatura diferencaMaiorMenor :: [Int] -> Int, a qual recebe uma lista de Int e retorna a diferenca entre o maior e o menor elemento da lista. Retorne 0 caso a lista for vazia.
-}

menor :: [Int] -> Int
menor [] = 0
menor [a] = a
menor (a:b) 
  | a < m = a
  | otherwise = m
  where m = menor b

maior :: [Int] -> Int
maior [] = 0
maior [a] = a
maior (a:b)
  | a > m = a
  | otherwise = m
  where m = maior b

diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor [] = 0
diferencaMaiorMenor lista = (maior lista) - (menor lista)

main = do
  print (diferencaMaiorMenor [1..20])
  print (diferencaMaiorMenor [-1,6,-7,2,10])
  print (diferencaMaiorMenor [])
