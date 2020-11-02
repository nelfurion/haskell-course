-- Lambda expressions are nameless (anonymous functions)

-- Anonymous function to double a number
(\x -> 2*x) 

-- \ represents the Greek letter lambda (written as l) 

-- Lambdas with map

  odds :: Int -> [Int] -- return the first n odd numbers
  odds n = map f [0..n-1]

  f :: Int -> Int
  f x = x * 2 + 1

  -- This can be written as
  odds n = map (\x -> 2 * x + 1) [0..n-1]