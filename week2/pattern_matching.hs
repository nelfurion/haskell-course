
-- Input has two things of types a and b. Returns something of type a
-- This is the function signature
fst :: (a,b) -> a

-- This is the function defintion. Take a tuple with x and something else and return x.
fst (x, _) = x

-- take a tuple with types a and b and return 
-- Signature
snd :: (a, b) -> b

-- Definition
-- Take a tuple with something and x and return x
snd (_, x) = x


-- LISTS
-- Lists are composite / abstract data types

{-

Lists are constructed one element at a time, starting from the empty list - [], and using the 
"cons" - (:) operator.

The list [1,2,3] is equivalent to 1:(2:(3:[])).


Two useful list operators:

-- !!(xs!!n returns the nth element of xs, starting at 0)
++(xs++ys returns a single list of all the elements of xs followed by all the elements of ys)

-}

head :: [a] -> a
-- Take something that is in the form of an element x attached to the front of something else
head (x:_) = x

-- Take a list and return a list
tail :: [a] -> [a]
-- Take a list and return everything except the first element
-- This argument's name should end in s, because we are talking about a list of items
tail (_:as) = as

-- !! Note that the cons patterns (x:_) and (_:xs) must be parenthesised!
-- Otherwise Haskell is going to treat those as separate arguments to the function.

-- Signature of last element with a monad. The list may be empty.
last :: [a] -> Maybe a
-- Definition of last element with recursion and monads
last [] = Nothing
last (a:[]) = Just a
last (a:as) = last as

{- 
From Stackoverflow:

Just

It's actually just a normal data constructor that happens to be defined in the Prelude, which is the standard library that is imported automatically into every module.

What "Maybe" is, Structurally

The definition looks something like this:

  data Maybe a = Just a
                | Nothing

That declaration defines a type, Maybe a, which is parameterized by a type variable a, which just means that you can use it with any type in place of a.

Constructing and Destructing
The type has two constructors, Just a and Nothing. When a type has multiple constructors, it means that a value of the type must have been constructed with just one of the possible constructors. For this type, a value was either constructed via Just or Nothing, there are no other (non-error) possibilities.

Since Nothing has no parameter type, when it's used as a constructor it names a constant value that is a member of type Maybe a for all types a. But the Just constructor does have a type parameter, which means that when used as a constructor it acts like a function from type a to Maybe a, i.e. it has the type a -> Maybe a

So, the constructors of a type build a value of that type; the other side of things is when you would like to use that value, and that is where pattern matching comes in to play. Unlike functions, constructors can be used in pattern binding expressions, and this is the way in which you can do case analysis of values that belong to types with more than one constructor.

In order to use a Maybe a value in a pattern match, you need to provide a pattern for each constructor, like so:

case maybeVal of
    Nothing   -> "There is nothing!"
    Just val  -> "There is a value, and it is " ++ (show val)
In that case expression, the first pattern would match if the value was Nothing, and the second would match if the value was constructed with Just. If the second one matches, it also binds the name val to the parameter that was passed to the Just constructor when the value you're matching against was constructed.

What Maybe Means
Maybe you were already familiar with how this worked; there's not really any magic to Maybe values, it's just a normal Haskell Algebraic Data Type (ADT). But it's used quite a bit because it effectively "lifts" or extends a type, such as Integer from your example, into a new context in which it has an extra value (Nothing) that represents a lack of value! The type system then requires that you check for that extra value before it will let you get at the Integer that might be there. This prevents a remarkable number of bugs.

Many languages today handle this sort of "no-value" value via NULL references. Tony Hoare, an eminent computer scientist (he invented Quicksort and is a Turing Award winner), owns up to this as his "billion dollar mistake". The Maybe type is not the only way to fix this, but it has proven to be an effective way to do it.

Maybe as a Functor
The idea of transforming one type to another one such that operations on the old type can also be transformed to work on the new type is the concept behind the Haskell type class called Functor, which Maybe a has a useful instance of.

Functor provides a method called fmap, which maps functions that range over values from the base type (such as Integer) to functions that range over values from the lifted type (such as Maybe Integer). A function transformed with fmap to work on a Maybe value works like this:

case maybeVal of
  Nothing  -> Nothing         -- there is nothing, so just return Nothing
  Just val -> Just (f val)    -- there is a value, so apply the function to it
So if you have a Maybe Integer value m_x and an Int -> Int function f, you can do fmap f m_x to apply the function f directly to the Maybe Integer without worrying if it's actually got a value or not. In fact, you could apply a whole chain of lifted Integer -> Integer functions to Maybe Integer values and only have to worry about explicitly checking for Nothing once when you're finished.

Maybe as a Monad
I'm not sure how familiar you are with the concept of a Monad yet, but you have at least used IO a before, and the type signature IO a looks remarkably similar to Maybe a. Although IO is special in that it doesn't expose its constructors to you and can thus only be "run" by the Haskell runtime system, it's still also a Functor in addition to being a Monad. In fact, there's an important sense in which a Monad is just a special kind of Functor with some extra features, but this isn't the place to get into that.

Anyway, Monads like IO map types to new types that represent "computations that result in values" and you can lift functions into Monad types via a very fmap-like function called liftM that turns a regular function into a "computation that results in the value obtained by evaluating the function."

You have probably guessed (if you have read this far) that Maybe is also a Monad. It represents "computations that could fail to return a value". Just like with the fmap example, this lets you do a whole bunch of computations without having to explicitly check for errors after each step. And in fact, the way the Monad instance is constructed, a computation on Maybe values stops as soon as a Nothing is encountered, so it's kind of like an immediate abort or a valueless return in the middle of a computation.

You Could Have Written Maybe
Like I said before, there is nothing inherent to the Maybe type that is baked into the language syntax or runtime system. If Haskell didn't provide it by default, you could provide all of its functionality yourself! In fact, you could write it again yourself anyway, with different names, and get the same functionality.

Hopefully you understand the Maybe type and its constructors now, but if there is still anything unclear, let me know!

-}
