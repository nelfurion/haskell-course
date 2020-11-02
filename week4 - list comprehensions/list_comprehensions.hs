-- All x squared from a list

[x^2 | x <- [1..5]]

[(x, x^2) | x <- [1..5]]

-- Produce all possible combinations of x and y from the 2 generators

[(x, y) | x <- [1..3], y <- [10,20]]
[(x, y) | x <- [1..3], y <- [x..3]]

[(x, y) | x <- [1..3], y <- [1..x]]

-- General from
{-
  
Form:

[e | q1, ..., qn ]

where each qualifier cacn take one or two forms:
  - A generator, of the form
    - x <- list where the list itself can be an expression
    - a guard which is a Boolean expression, to filter things

Guards can filter the generated values

-}

[ x | x <- [1..10], odd x]

findFirsts :: [(String, Int)] -> [String]
findFirsts result_list = [name | (name, mark) <- result_list, mark >= 70]

pythagorean :: Int -> [(Int, Int, Int)]
pythagorean n = 
  [ 
    (x, y, z) |
      x <- [2 .. n],
      y <- [x + 1 .. n],
      z <- [y + 1 .. n],
      x^2 + y^2 == z^2 
  ]

-- List Permutations
[ x | x <- [0..length items]]
[ it | it <- items ]

-- \\ operator from Data.List returns the difference of 2 lists

import Data.List 

perms :: Eq a => [a] -> [[a]]
perms [] = [[]]
perms xs = 
  [ 
    x:ps | 
      x <- xs,
      ps <- perms(xs \\ [x])
  ]

-- Strings

repsCount :: Char -> String -> Int
repsCount x string = length [ y | y <- string, x == y]

-- zip takes pairs of elements of 2 lists until one list is exhausted
-- [..] Produces an infinite list.
-- Because zip stops when string is exhausted, Haskell - a lazy language - 
-- never generates more than "length string" integers.


matchIndexes :: Char -> String -> [Int]
matchIndexes x string = [ n | (y, n) <- zip string [0..], x == y ]

-- Caesar cipher
-- assume input is lowercase
let2int :: Char -> Int
let2int c = ord c - ord 'a'
int2let :: Int -> Char
int2let n = chr(ord 'a' + n)

shift :: String -> Int -> String
shift string n = 
  [
    int2let (ascValue) |
      ascValue <- [ (let2int (l) + n) `mod` 26 | l <- string ]
  ]

shiftLetter :: Int -> Char -> Char
shiftLetter n c 
  | isLower c = int2let ((let2int c + n) `mod` 26)
  | isUpper c = shift n (toLower c)
  | otherwise = c

-- Other list functions
{-
concat
last
init
replicate
take
drop
splitAt
reverse
unzip
and
or
sum
product
-}