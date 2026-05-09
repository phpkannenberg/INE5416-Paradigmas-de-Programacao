{-
Crie uma funcao com assinatura apagar :: Int -> [t] -> [t], a qual recebe um numero de elementos, uma lista, e retorna uma lista.
Esta funcao deve remover da lista os n primeiros elementos fornecidos como paramentro.
-}

apagar :: Int -> [t] -> [t]
apagar _ [] = []
apagar 1 (a:b) = b
apagar x (a:b) = (apagar (x - 1) b)

main = do
  print (apagar 3 [1..20])
