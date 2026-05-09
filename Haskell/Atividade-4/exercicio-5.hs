{-
Crie uma funcao que receba tres notas de um aluno (a, b, c), calcule a media e retorne se o aluno foi aprovado ou reprovado.
Para um aluno ser aprovado, ele deve possuit nota igual ou superior a 6.
Leia as notas dos alunos do teclado.
-}

media :: Float -> Float -> Float -> Float
media x y z = (x + y + z) / 3

main = do
  putStrLn "Nota 1: "
  nota1Str <- getLine
  putStrLn "Nota 2: "
  nota2Str <- getLine
  putStrLn "Nota 3: "
  nota3Str <- getLine
  let nota1 = (read nota1Str :: Float)
  let nota2 = (read nota2Str :: Float)
  let nota3 = (read nota3Str :: Float)
  print(media nota1 nota2 nota3)
