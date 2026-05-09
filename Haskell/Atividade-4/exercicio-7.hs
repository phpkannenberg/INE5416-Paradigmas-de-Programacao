{-
Crie uma funcao que compute o n-esimo numero de Fibonacci. Leia n do teclado.
-}

fibonacci :: Int -> Int
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

main = do
  putStrLn "Insira um numero: "
  nStr <- getLine
  let n = (read nStr :: Int)
  print(fibonacci n)
