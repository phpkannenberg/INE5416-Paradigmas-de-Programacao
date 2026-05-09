{-
Crie uma funcao com assinature busca :: [Int] -> Int -> Bool, a qual recebe uma lista de Int e um Int e retorna se o elemento passado como parametro encontra-se na lista ou nao.
-}

busca :: [Int] -> Int -> Bool
busca [] _ = False
busca (a:b) x
  | a == x = True
  | otherwise = busca b x

main = do
  print (busca [1,2,3,5] 4)
  print (busca [1,2,3,5] 5)
  print (busca [] 4)
