{- 1
[Hutton, ex 2.3] The script below contains three syntactic errors. Correct these errors
and then check that your script works properly.
N = a 'div' length xs
 where
 a = 10
 xs = [1, 2, 3, 4, 5]
-}

{- 
1.1

f = a `div` length xs
  where
    a = 10
    xs = [1, 2, 3, 4, 5]

1.2 
xs = [1, 2, 3, 4, 5]
a = 10
n = a `div` length xs

-}

{- 2
What are the types of the following functions?

second xs = head (tail xs) // [a] -> a
swap (x,y) = (y,x) // (t1, t) -> (t, t1)
pair x y = (x,y) // t1 -> t2 -> (t1, t2)
double x = x*2 // t -> t 
palin xs = reverse xs == xs // [a] -> Bool
twice f x = f (f x) // (a -> a) -> a -> a
-}


{- 3
[Hutton, ex 4.1] Using library functions, define a function
halve :: [a] -> ([a],[a])
that splits an even-lengthed list into two halves. For example:
> halve [1, 2, 3, 4, 5, 6]
([1, 2, 3], [4, 5, 6])
-}

halve as = (take half as, drop half as)
  where
    half = length as `div` 2

{- 4
Implement a function for computing the Euclidean distance between two points,
(x1,y1) and (x2,y2).
Reminder: the Euclidean distance is given by:
√((𝑥2 − 𝑥1)^2 + (𝑦2 − 𝑦1)^2)
-}

-- eudist :: (a, a) -> (a, a) -> (a, a)
eudist (x1, y1) (x2, y2) = ((x2 - x1)^2, (y2 - y1)^2)

{-
Define a function that uses library functions to return the first word in a string. For
example:
> firstWord "a test string"
"a"
>firstWord " the trickier test string"
“the”
Remember to include a type for your function.
-}

firstWord :: String -> String
firstWord string = takeWhile (\x -> x >='A' && x <='z') string

{- 6
There are two library functions that were deliberately not included in the list at the
start of this sheet: head and tail. These two functions return the first item in a list
and the remainder of the list, respectively. Show how you would write these two
functions using pattern matching.
Write a new function, safeTail, that instead of generating an error when the input is
an empty list (as tail does), simply returns an empty list. See if you can provide two
different solutions:
1. Using a conditional expression
2. Using guarded equations
Note that the reason head and tail are not included in the list of functions to know is
that it is preferable to use pattern matching.
-}

head (a:as) = a
tail (a:as) = as

safeTail :: [a] -> [a]
safeTail [] = []
safeTail (a:as) = as

{-7
Define the following functions in a file with their type signatures
1. stack takes the first element of a list and puts it on the end of a list
2. range takes a numerical value and checks to see if it is between 0 and 10,
returns True if it is False otherwise
3. addc takes a Char and a String and adds the Char to the beginning of the
String
4. halves takes a list and divides each element in the list by two
5. capitalizeStart that takes a string as input and returns the same string with
the first character capitalized. (If the first character is not a lowercase letter,
it should simply return the input string.)
-}