{-
Crie uma funcao que receba tres inteiros x, y e z e retorne se havendo varetas com esses valores em
comprimento pode-se construir um triangulo. Leia x, y e z do teclado.
-}

haTriangulo :: Float -> Float -> Float -> Bool
haTriangulo x y z = (x <= y + z) && (y <= x + z) && (z <= x + y)

main = do
  putStrLn "Lado A: "
  aStr <- getLine
  putStrLn "Lado B: "
  bStr <- getLine
  putStrLn "Lado C: "
  cStr <- getLine
  let a = (read aStr :: Float)
  let b = (read bStr :: Float)
  let c = (read cStr :: Float)
  print(haTriangulo a b c)
