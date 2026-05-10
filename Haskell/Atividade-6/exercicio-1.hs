{-
Crie um tipo de dados Aluno, usando type. O tipo Aluno deve possuir um campo para o nome, outro para a disciplina e outros tres para notas.
Agora, execute os passos abaixo:
A: Crie uma funcao que receba um inteiro e retorne um Aluno correspondente ao valor inteiro.
B: Crie alguns alunos de exemplo.
C: No main, imprima o primeiro nome de um aluno, portanto crie uma funcao para obter o primeiro nome.
D: Crie uma funcao que receba um Int e retorne a media do aluno correspondente.
E: Crie uma funcao que calcule a media da turma, ou seja, considerando todos os alunos.
-}

type Nome = String
type Disciplina = String
type Nota = Float
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

aluno :: Int -> Aluno
aluno 1 = ("Pedro", "Paradigmas", 8, 9, 8)
aluno 2 = ("Julia", "Sistemas Operacionais", 10, 9, 7)
aluno 3 = ("Apolonio", "Grafos", 10, 10, 10)

getNome :: Int -> Nome
getNome id = nome
  where (nome, _, _, _, _) = aluno id

getMedia :: Int -> Float
getMedia id = (n1 + n2 + n3) / 3
  where (_, _, n1, n2, n3) = aluno id

getMediaTurma :: Int -> Float
getMediaTurma qtd = somaMedias qtd / fromIntegral qtd
  where somaMedias 1 = getMedia 1
        somaMedias n = getMedia n + somaMedias (n - 1)

main = do
  putStrLn (show (getNome 1))
  putStrLn (show (getMedia 1))
  putStrLn (show (getNome 2))
  putStrLn (show (getMedia 2))
  putStrLn (show (getNome 3))
  putStrLn (show (getMedia 3))
  putStrLn (show (getMediaTurma 3))
