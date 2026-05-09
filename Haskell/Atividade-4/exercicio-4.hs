{-
Crie uma funcao que receba dois valores booleanos (x, y) e retorne o resultado do "ou exclusivo" (XOR) sobre eles.
A funcao deve apenas usar os operadores &&, || e not. Leia os valores do teclado.
-}

xor :: Bool -> Bool -> Bool
xor x y = (x || y) && not (x && y)

main = do
  putStrLn "Digite um booleano: "
  primeiroBoolStr <- getLine
  putStrLn "Digite outro booleano: "
  segundoBoolStr <- getLine
  let primeiro = (read primeiroBoolStr :: Bool)
  let segundo = (read segundoBoolStr :: Bool)
  print(xor primeiro segundo)


