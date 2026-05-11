module Resolvedor where

import Tabuleiro

-- percorre sequencialmente o tabuleiro ate encontrar uma celula branca vazia
encontrarCelulaVazia :: Tabuleiro -> Maybe Posicao
encontrarCelulaVazia tab = procurar 0 0
  where procurar 8 _ = Nothing
        procurar l 8 = procurar (l + 1) 0
        procurar l c = case getCelula tab (l, c) of
                         Branca 0 -> Just (l, c)
                         _ -> procurar l (c + 1)
        
-- resolve tabuleiro usando backtracking
-- 1) encontra uma celula vazia, 
-- 2) "chuta" um valor possivel,
-- 3) confere se jogada com valor selecionado eh valida,
-- 4)
--   a) se jogada valida, tenta preencher o tabuleiro tomando chute como verdadeiro,
--     I) procede para etapa 1,
--     II) se encontrar solucao, retorna tabuleiro solucionado,
--     III) caso contrario, volta para etapa 2,
--   b) caso contrario, volta para etapa 2.
resolverTabuleiro :: Tabuleiro -> Maybe Tabuleiro
resolverTabuleiro tab = case encontrarCelulaVazia tab of
                          Nothing -> if todasPretasValidas tab then Just tab
                                     else Nothing
                          Just pos -> tentarValores [1..tamanhoTabuleiro]
                            where tentarValores [] = Nothing
                                  tentarValores (a:b) =
                                    if jogadaValida tab pos a 
                                    then 
                                      case resolverTabuleiro novoTab of
                                        Just sol -> Just sol
                                        Nothing -> tentarValores b
                                    else tentarValores b
                                      where novoTab = setCelula tab pos (Branca a)
                                    
