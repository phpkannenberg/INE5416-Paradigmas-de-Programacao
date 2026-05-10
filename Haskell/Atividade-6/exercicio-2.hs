{-
Altere nosso exemplo da forma e inclua uma nova forma (Triangulo) no construtor do tipo Forma e tambem calcule sua area.
-}

data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo b a) = (b * a) / 2

main = do
  putStrLn (show (area (Triangulo 3 3)))
