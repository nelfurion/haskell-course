-- function definitions
-- Negation
-- The first line is only the function signature, but in and of itself it
-- does not define the function.
f1 :: Bool -> Bool
f1 True = False
f1 False = True

-- This function takes 2 arguments
f2 :: Bool -> Bool-> Bool
-- f2 :: Bool Bool-> Bool // does not work
f2 True True = True
f2 _ _ = False -- The underscore is wildcard that matches any value

{- 
In Haskell, all functions are considered curried: That is, all functions > in Haskell take just single arguments.

This is mostly hidden in notation, and so may not be apparent to a new Haskeller. Let's take the function

    div :: Int -> Int -> Int

which performs integer division. The expression div 11 2 unsurprisingly evaluates to 5. But there's more that's going on than immediately meets the untrained eye. It's a two-part process. First,

    div 11 

is evalueated and returns a function of type

    Int -> Int

Then that resulting function is applied to the value 2, and yiealds 5. Tyou'll notice that the notatiton for types reflexts this: you can read

    Int -> Int -> Int

incorrectly as "takes 2 ints and returns an int", but what it;s really saying is "takes an int and returns something of the type int -> int" -- that is, it returns a function that tales an int and returns an int. (Obe can write the type as Int x Int -> int if you really mean the former -- but since all fucntions in Has.kell are curreidn, that's not legal Haskell. Alternatively, using typles, you can write (Int, Int) -> Int, but leep in mind that the tuple constructor (,) itself can be curried.)
-}

