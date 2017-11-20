{-
* Custom typeclasses* 
How to make our own typeclasses and 
how to make types instances of them by hand

Here is a way to define the typeclass Eq:

class Eq a where  
    (==) :: a -> a -> Bool  
    (/=) :: a -> a -> Bool  
    x == y = not (x /= y)  
    x /= y = not (x == y) 

The syntax is to use the class keyword, then the name of the 
typeclass, then a type variable (when instances are created,
this gets replaced with an actual type, then where, then 
type declarations of the functions the type is supposed to implement

Think of the above as somewhat analogous to defining an interface
in Java, except you can also implement functions (though this is 
optional)

* Manually making a type an instance of a type class *

Suppose we wanted to make a new type, TrafficLight as follows:
-}

data TrafficLight = Red | Yellow | Green  

{-
Suppose also we want it to implement Eq. We could, like before write:

data TrafficLight = Red | Yellow | Green deriving (Eq)

What if we want more control
over how the functions used in Eq work for TrafficLight. Then we can
write:
-}

instance Eq TrafficLight where  
    Red == Red = True  
    Green == Green = True  
    Yellow == Yellow = True  
    _ == _ = False  

instance Show TrafficLight where  
    show Red = "Red light"  
    show Yellow = "Yellow light"  
    show Green = "Green light"  

{-
If we do it this way, we can define the functions how we want. Here
We define == for each of the combinations we can get with 
TrafficLight

Note: in the definition of Eq, we defined == in terms of /= and vice
versa. If we didn't do this, we would also have to implement that in 
our TrafficLight instance

Try:
ghci> Red == Red  
True  
ghci> Red == Yellow  
False  
ghci> Red `elem` [Red, Yellow, Green]  
True  
ghci> [Red, Yellow, Green]  
[Red light,Yellow light,Green light]  


Typeclasses can also be of other type classes
We could

class (Eq a) => Num a where  
. . .

This would be a definition of Num that requires a to first be 
an Eq

* Monoids *
See https://wiki.haskell.org/Monoid
http://blog.sigfpe.com/2009/01/haskell-monoids-and-their-uses.html

Monoid is a type class that requires this of its types:
1. A rule that takes any two instances of the type to create
another instance of the type
2. A value that's equivalent to nothing, so that when added to an
instance of the type just returns the instance unchanged

Example: lists have rules to combine two lists to create a list, and 
for combining [] with a list to leave the list unchanged

Here's the class definition:

class Monoid m where
  mempty :: m
  mappend :: m -> m -> m
  mconcat :: [m] -> m
  -- defining mconcat is optional, since it has the following default:
  mconcat = foldr mappend mempty

Together with these laws (not enforced, but expected):
-- Identity laws
x <> mempty = x
mempty <> x = x
 
-- Associativity
(x <> y) <> z = x <> (y <> z)


We could manually make list an instance of Monoid:
instance Monoid [a] where
    mappend = (++)
    mempty = []

Why Monoids?

Free function: monocat --- combines elements of a list into one
element (like fold). This function is implemented by default
as shown above.


-}