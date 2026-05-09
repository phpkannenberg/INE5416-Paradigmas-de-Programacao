{-
Crie uma funcao com assinatura inverte :: [t] -> [t], a qual recebe uma lista como paramentro e deve retornar a mesma invertida.
-}

inverte :: [t] -> [t]
inverte (a:b) = (inverte b) ++ [a]

main = do
  print (inverte [1..9])
