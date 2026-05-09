{-
Crie uma funcao com assinatura apagarEnquanto :: (t -> Bool) -> [t] -> [t], a qual recebe uma funcao como parametro e uma lista, e retorna uma lista.
Esta funcao deve aplicar a funcao passada como parametro a cada elemento da lista, ate que algum elemento da lista retorne False na aplicacao da funcao.
Os elementos da lista resultante sao entao todos os elementos a partir do elemento em que a funcao passada como parametro retornou False.
-}

apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto _ [] = []
apagarEnquanto f (a:b)
  | f a = apagarEnquanto f b
  | otherwise = (a:b)
  
ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

main = do
  print (apagarEnquanto ehPar [2,4,5,6,7])
