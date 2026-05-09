{-
Crie uma funcao com assinatura filtrar :: (t -> Bool) -> [t] -> [t], a qual recebe uma funcao, uma lista e retorna uma nova lista. 
Esta funcao aplica a funcao recebida como parametro sobre cada elemento da lista e caso o retorno da funcao for verdadeiro, 
entao o elemento fara parte da nova lista, caso contrario nao. Para esta tarefa, utilize o conceito de list comprehension. 
-}

filtrar :: (t -> Bool) -> [t] -> [t]
filtrar f lista = [x | x <- lista, f x]

ehPar :: Int -> Bool
ehPar x = mod x 2 == 0

main = do
  print (filtrar ehPar [1..10])
