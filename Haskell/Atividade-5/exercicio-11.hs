{-
Crie uma funcao com assinatura primeiros :: Int -> [t] -> [t], a qual recebe um numero de elementos, uma lista, e retorna uma lista.
Esta funcao deve retornar uma lista com os n primeiros elementos informados no primeiro parametro.
-}

primeiros :: Int -> [t] -> [t]
primeiros _ [] = []
primeiros 1 (a:b) = [a]
primeiros x (a:b) = a : (primeiros (x - 1) b)

main = do
  print (primeiros 3 [1..20])
