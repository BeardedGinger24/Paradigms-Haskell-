import Data.List
-- lab 5

searchNext :: Int -> [Int] -> Int
searchNext n [] = -1
searchNext n (x:[]) = -1
searchNext n (x:y:xs)
            | x == n = y
            | otherwise = searchNext n (y:xs)


searchPrevious :: Int -> [Int] -> Int
searchPrevious n [] = -1
searchPrevious n (x:[]) = -1
searchPrevious n (x:y:xs)
            | n == x = -1
            | n == y = x
            | otherwise = searchPrevious n (y:xs)

sumDigit' :: String -> Int
sumDigit' [] = -1
sumDigit' (x:[]) = read (x:[])
sumDigit' (x:xs) = sumDigit' (x:[]) + sumDigit' xs

sumDigit :: Int -> Int
sumDigit n = sumDigit' (show n :: String)

super_digit :: Int -> Int
super_digit n
    | n < 10 = n
    | otherwise = super_digit(sumDigit n)

-- HW1
-- write a recursive method to compute m(i) = 1 + 1/2 + 1/3, ... + 1/i


series :: Int -> Float
series x 
        |x <= 1 = 1 
        |otherwise = (series (x-1)) + (1/(fromIntegral x))

-- write a recursive method to compute m(i) = 1/2, 2/3, ... i/(i + 1) 

series2 :: Int -> Float
series2 x
        |x == 1 = (v/(v + 1))
        |otherwise = (v/(v + 1)) + series2 (x-1)
        where v = fromIntegral x

-- ?? write a method that finds the Super Digit of a number. Super digit
-- is defined recursively:

-- Implement a method that removes the max element from a list of Ints
removemax [] = []
removemax (x:[]) = []
removemax (x:xs)
    |maximum (x:xs) == x = xs
    |otherwise = [x] ++ removemax(xs)


--
msort :: [Int] -> [Int]
msort [] = []
msort (x:[]) = [x]
msort list = msort (removemax list) ++ [(maximum list)]

-- Lab 6
{-
2pts) Using + as a function, create a function, using the first, that adds a 
number to 10.
-}


addTen :: Int -> Int
addTen = (+ 10)

{-
2pts) Using partial application/currying, create a 
function that checks if a Char is a lowercase letter
-}

isLowerCase :: Char -> Bool
isLowerCase = (`elem` ['a' .. 'z'])

{-
2pts) Write a function that takes another function that 
takes an Int and returns an Int 
and an Int and applies it 3 times.
-}

applyThrice :: (Int -> Int) -> Int -> Int
applyThrice f x = f (f (f x))

{-
4pts) Using recursion, write a function that takes a 
function (which takes an Int and returns an Int) and 
a list of Ints, and applies the function 
to every other element in the list (applies to first, 
leaves the second alone, and so on), and returns a new list 
with the transformed and left-alone elements'{}
-}

everyOther :: (Int -> Int) -> [Int] ->[Int]
everyOther f [] = []
everyOther f (x:[]) = [(f x)]
everyOther f (x:y:therest) = (f x):y:(everyOther f therest)

{-
2pts) Write a function like zipWith, except that it takes 3 
lists and a function that takes 3 parameters, and returns a 
list with the function applied to each corresponding element 
in the 3 lists
-}

zipW3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
zipW3 f [] _ _ = []
zipW3 f _ [] _ = []
zipW3 f _ _ [] = []
zipW3 f (a:as) (b:bs) (c:cs) = (f a b c) : zipW3 f as bs cs


-- 2pts) Write a function that takes a function (Int -> Int) and an 
-- Int and returns (Int, Int), where the first element is the Int
-- without the function applied to it, and the second is the result  of 
-- applying the function to the Int.

toTuple :: (Int -> Int) -> Int -> (Int, Int)
toTuple f x = (x, f x)

-- 2pts) Using map and the function you just wrote, write a function that takes 
-- a list of Ints and a function (Int -> Int) and returns 
-- a new list of tuples, with the 
-- first element being the original element, and the second being 
-- the result of the transformation.

-- e.g. [1,2,3] becomes [(1,1), (2, 4), (3, 9)] if the function 
-- passed in returns the square of an element

toTuples :: (Int -> Int) -> [Int] -> [(Int, Int)]
toTuples f [] = []
toTuples f ls = map (toTuple f) ls

-- Homework 2

{-
1. 2pts) Create a function, using partial applications, 
that sees if a single Int is divisible by 5. 
It takes in an Int and returns a Bool.
-}

g100d5 :: Int -> Bool
g100d5 = (==0) . (`mod` 5)


{- 2. 2pts) Write a function that checks if every other letter of a 
string is between 'a' and 'f'. The function takes in a String and 
returns a Bool. Use partial application at least once.-}

checkEveryOther :: String -> Bool
checkEveryOther [] = True
checkEveryOther (x:[]) = (`elem` ['a' .. 'f']) x
checkEveryOther (x:y:therest) = (`elem` ['a' .. 'f']) x && (checkEveryOther therest) 

--9. 1pt) Consider this function:

applyThrice'' :: (Int -> Int) -> Int -> Int
applyThrice'' f x = f (f (f x))

--Use $ to make the second line more readable

applyThrice''' :: (Int -> Int) -> Int -> Int
applyThrice''' f x = f $ f $ f x

{-
10. 2pts) Convert:

isLowerCase :: Char -> Bool
isLowerCase x = x `elem` ['a' .. 'z']

to point free style
-}
isLowerCase' :: Char -> Bool
isLowerCase' = (`elem` ['a' .. 'z'])

{-

5pts) Pack repeats in a list of Chars into separate lists, resulting in a sorted list of lists: E.g., 

['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] becomes
["aaaaaa","b","cc","d","eeee"]

-}


gather :: (Ord a) => [a] -> [[a]]
gather [] = []
gather (x:xs) = t:gather (drop (length t) (x:xs))
    where t = takeWhile (==x) (x:xs)

pack :: (Ord a) => [a] -> [[a]]
pack x = gather $ sort x



    
