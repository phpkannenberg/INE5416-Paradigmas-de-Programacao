{-
Crie um novo tipo Ponto, usando data, que pode ser um ponto 2D ou um ponto 3D.
Depois, crie uma funcao que receba dois pontos (necessariamente ambos sendo 2D ou ambos sendo 3D), e retorne a distancia entre eles. 
-}

data Ponto = Ponto2D Float Float | Ponto3D Float Float Float

distancia :: Ponto -> Ponto -> Float
distancia (Ponto2D x1 y1) (Ponto2D x2 y2) = 
  sqrt ((x2 - x1)^2 + (y2 - y1)^2)
distancia (Ponto3D x1 y1 z1) (Ponto3D x2 y2 z2) =
  sqrt ((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
distancia _ _ = error "Pontos devem possuir mesma dimensao"

main = do
  putStrLn (show (distancia (Ponto2D 0 0) (Ponto2D 3 4)))
  putStrLn (show (distancia (Ponto3D 0 0 0) (Ponto3D 0 3 4)))
