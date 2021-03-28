main :: IO ()
main = putStrLn "Hello, World!"

-- Q1

luhnDobro :: Int -> Int
luhnDobro x
    | 2*x <= 9 = 2*x
    | otherwise = 2*x - 9

luhn :: Int -> Int -> Int -> Int -> Bool
luhn x y z w
    | sum[luhnDobro x, y, luhnDobro z, w] `mod` 10 == 0 = True 
    | otherwise = False

-- Q2

euclides :: Int -> Int -> Int
euclides x y 
    | x == y = x
    | x > y = euclides (x-y) y
    | otherwise = euclides (y-x) x

-- Q3

newMap :: (a -> b) -> [a] -> [b]
newMap f [] = []
newMap f (x) = foldr (\y ys -> (f y):ys) [] (x)

newFilter :: (a -> Bool) -> [a] -> [a]
newFilter f [] = []
newFilter f (x) = foldr (\y ys -> if (f y) then y:ys else ys) [] (x)

-- Q4
subLists :: [a] -> [[a]]
subLists [] = [[]]
subLists (x:xs) = [x:sublist | sublist <- subLists xs] ++ subLists xs

subSequences :: [a] -> [[a]]
subSequences [] = [[]]
subSequences [x] = [[x]]
subSequences (x:xs) = [x:subseqs | subseqs <- [xs]] ++ subSequences xs ++ [[x]]

-- Q4
-- [m*m] | m <- [1 .. 10]] = map (\x -> x*x) [1 .. 10]

-- [m*m] | m <- [1 .. 10], m*m < 50] = filter (<50) (map (\x -> x*x) [1 .. 10])

-- [x+y | x <- [1 .. 4], y <- [2 .. 4], x > y] = 
--      concat [[x+y | y <- [2 .. 4], x > y] | x <- [1 .. 4]] =
--      concat [[x+y | y <- filter (<x) [2 .. 4]] | x <- [1..4]] =
--      concat [map (+x) (filter (<x) [2 .. 4]) |  x <- [1..4]] =
--      concat (map (\x -> map (+x) (filter (<x) [2 .. 4])) [1..4])

-- [x:p | x <- xs, p <- perms (xs\\[x])] = 
--    concat[[x:p | p <- perms (xs\\[x])] | x <- xs] = 
--    