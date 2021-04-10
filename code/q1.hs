import Test.QuickCheck
import Tree ( Tree, nil, isNil, leftSub, rightSub, insTree )


-- Gerador
instance (Arbitrary a, Ord a ) => Arbitrary( Tree a ) where
    arbitrary = sized genTree

genTree :: (Arbitrary a, Ord a) => Int -> Gen (Tree a)
genTree 0 = return nil
genTree n = do 
            valor <- arbitrary
            arvoreGerada <- genTree (n-1)
            return (insTree valor arvoreGerada)

-- Uma árvore binária com N nós internos tem, no máximo, N+1 folhas

calculoNumeroNos :: Tree a -> Int 
calculoNumeroNos a
    | isNil a = 0
    | otherwise = 1 + (calculoNumeroNos (leftSub a)) + (calculoNumeroNos (rightSub a))


calculoNumeroFolhas :: Tree a -> Int 
calculoNumeroFolhas a
    | isNil a = 0
    | otherwise = 0 + (calculoNumeroNos (leftSub a)) + (calculoNumeroNos (rightSub a))

prop_1 :: (Num a) => Tree a -> Bool 
prop_1 a
    | calculoNumeroNos a - calculoNumeroFolhas a <= calculoNumeroFolhas a + 1 = True -- numero de nós que não são folhas é menor ou igual ao número de folhas + 1
    | otherwise = False

-- O número máximo de nós de uma árvore binária de altura h é 2^(h+1) − 1

ehFolha :: Tree a -> Bool 
ehFolha a = (isNil (leftSub a)) && (isNil (rightSub a ))

calculoAltura :: Tree a -> Int 
calculoAltura a
    | isNil a = 0
    | ehFolha a = 0
    | otherwise = 1 + max (calculoAltura (rightSub a)) (calculoAltura (leftSub a))

prop_2 :: (Num a) => Tree a -> Bool 
prop_2 a 
    | calculoNumeroNos a <= (2 ^ ((calculoAltura a) + 1)) -1 = True
    | otherwise = False

-- Para qualquer árvore binária não vazia com n0 nós folha e n2 nós de grau 2, n0 = n2 + 1

ehGrau2 :: Tree a -> Bool
ehGrau2 a
    | isNil a = False 
    | not(isNil (leftSub a)) && not(isNil (rightSub a )) = True
    | otherwise = False

calculoGrau2 :: Tree a -> Int 
calculoGrau2 a
    | isNil a = 0
    | ehGrau2 a = 1 + (calculoGrau2 (rightSub a)) + (calculoGrau2 (leftSub a))
    | otherwise = 0 + (calculoGrau2 (rightSub a)) + (calculoGrau2 (leftSub a))

prop_3 :: (Num a) => Tree a -> Bool 
prop_3 a
    | isNil a = True -- Árvores Nulas não são consideradas
    | otherwise = calculoGrau2 a <= (calculoNumeroFolhas a) + 1