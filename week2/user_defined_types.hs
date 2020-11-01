-- 1. Type Synonyms

-- Pos is a synonym of (Int, Int)
-- | Pos represents a 2D point
type Pos = (Int, Int)

moveUp :: Pos -> Pos
moveUp (x, y) = (x, y + 1)

-- They can be nested

-- Trans is the type of a function that takes 1 2D point and returns another.
type Trans = Pos -> Pos

-- You cannot self-reference user defined types

type Tree = (Int, [Tree])

-- CANNOT be used to create a tree data structure

-- 2. Define new types
-- If we want to define a type that is completely new( as opposed to a synonym for an existing type), we need to use the data mechanism.

-- For exmaple, Bool is defined in the standard Prelude like this:
data Bool = Flase | True

-- "|" is read as OR and the alternatives are called constructors
-- -- Constructors must start with a capital letter ( just like types)
-- -- You can't use constructors with the same name in different typed definitions
-- -- The constructor names have no actual meaning, they are just labels (but choose sensible labels, just like you choose sensible function and parameter names)

-- Using data declarations

data Move - North | East | South | West

-- When defining the funciton move we are pattern matching the different pssible values of the data type Move
move :: Move -> Pos -> Pos
move North (x, y) = (x, y + 1)
move East (x, y) = (x + 1, y)
move South (x, y) = (x, y - 1)
move West (x, y) =  (x - 1, y)

-- Construcrors can have parameters
-- Shape can either be a Circle which accepts a Float parameter
-- or it can be a Rectangle which accepts two Float parameters
data Shape = Circle Float | Rect Float Float

-- We defined a type Shape which can be either a circle or a rectangle
-- -- If ti is a circle it is constructed with a single parameter
-- -- If ti is rectangle - two parameters

area :: Shape -> Float
area (Circle rr-> = pi * r^2
area (Rect l w) -> l * w

-- The constructors of Shape are acctually constructor functions
-- e.g.:
-- > :type Circle
-- > Circle :: Float -> Shape

-- Data delcarations can also be aprameterized
-- Parameterizing the data declaration itself, rather than it's constructors.
data Maybe a = Nothing | Just a

-- a here represents a type.

-- A value of type Maybe a can be either Nothing or 
-- of the form Just x, where x is a value of type a.

-- If we have a data type with a single constructor and a single argument, we can use the newtype mechanism instead.

-- These are very similar:
newtype Nat = N Int
type Nat = Int
data Nat = N Int

-- In particular the first and last are very similar. newtype is more efficient though.
-- The compiler uses the newtype to check, 
-- and then replaces it with the type synonym for run time.

-- Recursive types
type Tree = (Int, [Tree]) -- // NOT VALID

data Tree a = Leaf a | Node a [Tree a] -- // VALID
data Tree a = Leaf a | Node (Tree a) a (Tree a) -- // VALID Binary Tree