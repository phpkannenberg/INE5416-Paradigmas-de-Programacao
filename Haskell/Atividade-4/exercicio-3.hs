{-
Crie uma funcao que receba a base e a altura de um triangulo e calcule a area do mesmo.
Leia a base e a altura do teclado.
-}

areaTriangulo :: Float -> Float -> Float
areaTriangulo x y = (x * y) / 2

main = do
  putStrLn "Base: "
  baseString <- getLine
  putStrLn "Altura: "
  alturaString <- getLine
  let base = (read baseString :: Float)
  let altura = (read alturaString :: Float)
  print(areaTriangulo base altura)
  
