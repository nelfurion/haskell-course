-- Conditional expression
-- -- All conditional expression  in haskell must have an else block
-- -- They can be nested
max2 a b = if a > b then a else b
max22 a b c = if a > b then if a > c then a else c else if b > c then b else c


-- Guard - different way of responding to conditions
-- -- The expression is specified in terms of a series of guards and results
-- -- There is a catch-all otherwise guard that can be used to catch all cases that have 
-- -- not been explicitly specified
max3 a b c
  | a > b && a > c = a
  | b > c          = b
  | otherwise      = c