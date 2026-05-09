{-
Crie uma funcao com a seguinte assinatura aprovados :: [(Int, String, Float)] -> [String], a qual recebe uma lista de alunos e retorna uma lista com o nome dos alunos aprovados.
Um aluno esta aprovado se a sua media eh maior ou igual a 6. Utilize map e filter para resolver esta questao.
-}

aprovado :: (Int, String, Float) -> Bool
aprovado (a, b, media) = media >= 6

aprovados :: [(Int, String, Float)] -> [String]
aprovados lista = map getNome (filter aprovado lista)

{-
Crie uma funcao com a seguinte assinatura aprovados2 :: [(Int, String, Float)] -> [String], a qual recebe uma lista de alunos e retorna uma lista com o nome dos alunos aprovados.
Um aluno esta aprovado se a sua media eh maior ou igual a 6. Nao utilize map e filter para resolver esta questao. Utilize o conceito de list comprehension.
-}

aprovados2 :: [(Int, String, Float)] -> [String]
aprovados2 lista = [nome | (_, nome, nota) <- lista, nota >= 6]

alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

{-
Utilize (e modifique, se necessario) a funcao geraPares vista em aula e disponivel no arquivo alunos.hs para formar duplas de alunos.
Note que um aluno nao pode fazer dupla consigo mesmo.
-}

gerarPares :: [(Int, String, Float)] -> [(String, String)] 
gerarPares lista = [(nome1, nome2) | (_, nome1, _) <- lista, (_, nome2, _) <- lista, nome1 /= nome2]

main = do
    putStrLn "aprovados: "
    print (aprovados alunos)
    putStrLn "aprovados2: "
    print (aprovados2 alunos)
    putStrLn "Pares: "
    print (gerarPares alunos)
