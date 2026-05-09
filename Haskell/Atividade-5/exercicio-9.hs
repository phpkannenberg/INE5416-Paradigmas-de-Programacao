{-
Crie uma funcao com assinatura mapear :: (t -> y) -> [t] -> [y], a qual recebe uma funcao, uma lista e retorna uma lista.
Esta funcao mapear fara o mesmo que a funcao map, ou seja, aplicar a funcao recebida como parametro sobre cada elemento da lista e retornar a lista resultante.
Nao utilize map ou filter para esta tarefa.
-}

mapear :: (t -> y) -> [t] -> [y]
mapear _ [] = []
mapear f (a:b) = (f a) : (mapear f b)

dobro :: Int -> Int
dobro x = x * 2

main = do 
  print (mapear dobro [1..10])
