{-
Crie uma funcao com assinatura soma :: [Int] -> Int, a qual recebe uma lista de Int e retorna a soma de todos os elementos da lista.
-}

soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + (soma b)

main = do
  let lista = [1..20]
  putStrLn (show (soma lista))
