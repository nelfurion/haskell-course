-- Functional programming:
-- no iterations, no loops

f 0 = 0
f n
  | n > 0 = f (n-1)
  | otherwise = f (n+1)

fact 1 = 1
fact n
  | n > 0 = n * fact(n - 1)
  | 0

-- Recursion in lists

-- -- General pattern
-- -- -- Start with the first item in the list
-- -- -- Do something with it
-- -- -- Recurse with the rest of the list

-- Calculate the length of a list
length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + length xs

-- Member - true if item is in a list, false otherwise

member :: Eq a => a -> [a] -> Bool
member a [] = False
member a (a1:as) 
  | a == a1 = True
  | otherwise = member a as

-- Nth number of Fibonacci

fib :: Integral n => n -> Int
fib n
  | n == 0 = 1
  | n == 1 = 1
  | otherwise = fib(n - 1) + fib(n - 2)

-- Find the Nth item in a list

nthItem :: Int -> [a] -> a
nthItem n [] = error "List is emtpy"
nthItem n (elm:elements)
  | n == 0 = elm
  | n > 0 = nthItem(n-1) elements
  | otherwise = error "n must be >= 0"

-- Union
union :: Eq a => [a] -> [a] -> [a]
union [] bs = bs
union (a:as) bs
  | elem a bs = union as bs
  | otherwise = union as (a:bs)

-- Substitute
subst :: Eq a => a -> a -> [a] -> [a]
subst x y [] = []
subst x y (z:zs)
  | x == z = y:(subst x y zs)
  | otherwise = z:(subst x y zs)

-- Intersection
intersection :: Eq a => [a] -> [a] -> [a]
intersection [] bs = []
intersection as [] = []
intersection (a:as) bs
  | elem a bs = a:(intersection as bs)
  | otherwise = intersection as bs
