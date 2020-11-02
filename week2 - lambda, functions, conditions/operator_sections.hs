-- We have already seen how we can turn 2-argument functions into infix operators
-- (e.g. m `mod` n) from mod m n

-- We can do this for any two argument function

6 `div` 3
5 `elem` [2,4,6]
-- 2 `lcm` 10 ?? // 2 least common multiple 10


-- We can also do the converse:
-- We can turn an operator into a 2-argument function

-- We do it by surrounding the operator in parentheses and putting it on the left

-- (+) 2 3 === 2 + 3 === (2+) 3 === (+3) 2

-- Operator Sections

{- 

If * is an operator, expressions of the form (*), (x*) and (*y) for arguments
x and y are called sections.

There are 3 good reasons for using operator sections.

1. Compact functions

(1/) is the reciprocation function \y -> 1/y
(/2) is the halving function \y -> y/2

2. Operator Types

Needed when stating the ty[e of operators, e.g. for the addition operator

(+) :: Int -> Int -> Int
(+) :: Num a => a -> a -> a

The "thin arrow" is used for function types (t1 -> t2 being the type of a function that takes a value of type t1 and produces a value of type t2).

The "fat arrow" is used for type constraints. It separates the list of type constraints on a polymorphic function from the rest of the type. So given Floating a => a -> a, we have the function type a -> a, the type of a function that can take arguments of any type a and produces a result of that same type, with the added constraint Floating a, meaning that the function can in fact only be used with types that implement the Floating type class.

3. Use the operator as an Argument to another Function

Define a sorting function that takes an ordering function as an argument... so to use the same function with different arguments to sort in increasing or decreasing order.

-- This is defined with recursion.
-}