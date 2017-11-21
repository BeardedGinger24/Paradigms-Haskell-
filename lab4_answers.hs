generation :: Int -> String
generation year 
    | year > 1995 = "Generation Z"
    | year > 1980 = "Millennial"
    | year > 1965 = "Generation X"
    | year > 1945 = "Baby Boomer"
    | year > 1933 = "Silent Generation"
    | otherwise = "Greatest Generation"

generation2 :: Int -> String
generation2 age 
    | year > genz = "Generation Z"
    | year > mil = "Millennial"
    | year > genx = "Generation X"
    | year > bb = "Baby Boomer"
    | year > sg = "Silent Generation"
    | otherwise = "Greatest Generation"
    where 
        year = 2017 - age
        genz = 1995
        mil = 1980
        genx = 1965
        bb = 1945
        sg = 1933

hypo :: [(Float, Float)] -> [(Float)]
hypo xs = [hp x | x <- xs]
        where hp a = sqrt ((fst a)^2 + (snd a)^2)

pixlist :: Float -> [Float] -> [Float]
pixlist a xs = [x * v| x <- xs, let v = 3.14 * a]

mult3 :: [Int] -> Int  
mult3 xs = case xs of [] -> 0
                      (x:[]) -> x 
                      (x:y:[]) -> x*y
                      (x:y:z:_) -> x*y*z