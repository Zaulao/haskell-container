import Set
import Test.QuickCheck

-- Gerador
instance (Arbitrary a, Ord a ) => Arbitrary( Set a ) where
    arbitrary = sized genSet

genSet :: (Arbitrary a, Ord a) => Int -> Gen (Set a)
genSet 0 = return empty
genSet n = do 
            valor <- arbitrary
            setGerado <- genSet (n-1)
            return (union (sing (valor)) setGerado)


---- Check União
-- A ∪ B = B ∪ A
prop_1 :: (Num a, Ord a) => Set a -> Set a -> Bool 
prop_1 a b = (union a b) == (union b a) 

-- A ∪ (B ∪ C) = (A ∪ B) ∪ C.
prop_2 :: (Num a, Ord a) => Set a -> Set a -> Set a -> Bool
prop_2 a b c = (union a (union b c)) == (union c (union a b))

-- A ⊆ (A ∪ B).
prop_3 :: (Num a, Ord a) => Set a -> Set a -> Bool 
prop_3 a b = subSet a (union a b)

-- A ∪ A = A.
prop_4 :: (Num a, Ord a) => Set a -> Bool 
prop_4 a = a == union a a

-- A ∪ ∅ = A.
prop_5 :: (Num a, Ord a) => Set a -> Bool
prop_5 a = a == union a empty