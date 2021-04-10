import Relation
import Set
import Test.QuickCheck


-- Propriedade de BFS: Os nós de um grafo só são visitados uma única vez durante a busca
-- A propriedade busca entender se os nós retornados em um array de nós de uma BFS em um grafo apresenta apenas nós únicos.
checkArray :: (Ord a) => [a] -> Bool
checkArray a 
    | a == [] = True
    | otherwise = [a] == flatten (makeSet [a])

prop_1 :: (Ord a, Num a) => Relation a -> a -> Bool
prop_1 graph value = do response <- (checkArray (breadthFirst a v))
    return response