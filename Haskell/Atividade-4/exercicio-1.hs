{-
Crie uma funcao que receba dois numeros x e y e retorne x^y. Leia x e y do teclado.
-}

exponenciacao :: Int -> Int -> Int
exponenciacao x y = x ^ y

main = do
    -- le base e expoente
    putStrLn "Base: "
    baseString <- getLine
    putStrLn "Expoente: "
    expoenteString <- getLine
    -- coverte base e expoente de String para Int
    let base = (read baseString :: Int)
    let expoente = (read expoenteString :: Int)
    -- calcula resultado
    let resultado = (exponenciacao base expoente)
    -- imprime resultado
    print resultado
