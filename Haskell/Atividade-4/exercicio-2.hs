{-
Crie uma funcao que receba um numero x, negativo ou positivo, e retorne seu valor absoluto. 
Leia x do teclado.
-}

absoluto :: Float -> Float
absoluto x | (x >= 0) = x
           | otherwise = -x

main = do
    -- le numero
    putStrLn "Insira um numero: "
    nString <- getLine
    -- converte numero de String para Float
    let n = (read nString :: Float)
    -- calcula e imprime resultado
    print (absoluto n)
