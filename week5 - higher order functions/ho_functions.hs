-- 1. Express the comprehension [f x | x  xs, p x] using the functions map and filter.

mapWhere :: (a -> a) -> (a -> Bool) -> [a] -> [a]
mapWhere mf ff as = map mf (filter ff as)

-- 3. Implement your own version of maximum using one of the fold functions.

foldr2 :: (a -> b -> b) -> b -> [a] -> b
foldr2 (f) b (x:xs)
  | null xs = f x b
  | otherwise = f x (foldr2 f b xs)

foldr2 :: (a -> b -> b) -> b -> [a] -> b
foldr2 (f) b xs
  | null xs = b
  | length xs == 1 = f (head xs) b
  | otherwise = f (head xs) (foldr2 f b (tail xs))

{- 
Guards are just boolean expressions. They do not do 
pattern matching by default. The <- left arrow is a way to allow pattern
matching in guards. 
-}
mymax :: Ord a => [a] -> Maybe a
mymax (as)
  | null as = Nothing
  | (a:[]) <- as  = Just a
  | (a:otherAs) <- as = if Just a > (mymax otherAs) then Just a else mymax otherAs

maxFoldR :: Ord a => [a] -> a
maxFoldR [] = error "Does not work for empty arrays"
maxFoldR (a:as) = foldr (\x y -> if x >= y then x else y) a as

{- 4. Rewrite the following expressions as list comprehensions: -}
{- 
a. map (+3) xs
b. filter (>7) xs
c. concat (map (\x -> map (\y -> (x,y)) ys) xs)
d. filter (>3) (map (\(x,y) -> x+y) xys)
-}

mapComprehension :: Num a => [a] -> [a]
mapComprehension as = [a + 3 | a <- as]

filterComprehension :: (Ord a, Num a) => [a] -> [a]
filterComprehension as = [a | a <- as, a > 3]

concatComprehension :: [a] -> [a] -> [(a, a)]
concatComprehension xs ys = [(x, y) | x <- xs, y <- ys]

filterMapPairsComprehension :: (Num a, Ord a) => [(a, a)] -> [a]
filterMapPairsComprehension xys = [ x + y | (x, y) <- xys, x + y > 3]

{- 5. What does this function do?
mystery xs = foldr (++) [] (map sing xs)
 where
 sing x = [x]
Hint: Work through what it does for a simple list, e.g. [1,2,3]
-}
{- Answer: maps an array of xs to array of arrays of x. Then concatenates
them back to an array of xs -}

{- 6. Redefine map f and filter p using foldr -}

mapf:: (a -> b) -> [a] -> [b]
mapf f as = foldr (++) [] [[f a] | a <- as]

filterf :: (a -> Bool) -> [a] -> [a]
filterf f as = foldr (++) [] [[a] | a <- as, f a]