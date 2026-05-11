module Main where

import Resolvedor
import Tabuleiro

-- tabuleiro numero 51 da plataforma janko.at
tabuleiro51 :: Tabuleiro
tabuleiro51 = [
                [Branca 0, Preta 11, Preta 9, Branca 0, Preta 14, Branca 0, Branca 0, Branca 0],
                [Branca 0, Branca 0, Branca 0, Preta 17, Branca 0, Branca 0, Preta 18, Preta 12],
                [Branca 0, Preta 17, Preta 18, Branca 0, Branca 0, Preta 14, Branca 0, Branca 0],
                [Preta 12, Branca 0, Preta 16, Branca 0, Preta 16, Branca 0, Branca 0, Branca 0],
                [Branca 0, Branca 0, Branca 0, Preta 15, Branca 0, Preta 16, Branca 0, Preta 9],
                [Preta 12, Branca 0, Branca 0, Branca 0, Preta 10, Branca 0, Preta 18, Branca 0],
                [Branca 0, Preta 20, Branca 0, Preta 20, Branca 0, Preta 16, Branca 0, Branca 0],
                [Preta 6, Branca 0, Branca 0, Branca 0, Branca 0, Branca 0, Preta 11, Preta 9]
              ]
              
main :: IO ()
main = case resolverTabuleiro tabuleiro51 of
         Just solucao -> imprimirTabuleiro solucao
         Nothing -> putStrLn "Sem Solucao."
