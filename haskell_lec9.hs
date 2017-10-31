{-
** Modules **
These are collections of related functions, 
and typeclasses

They aren't automatically available: you have
to import them

in a script, put this at the top:
import <module name>
example:
import Data.List

At the command prompt:
prelude>:m Data.List

import qualified (have to type module name)
import qualified Data.List

to use:
Data.List.sort

or use an alias in the import:

import qualified Data.List as dl

Learn You a Haskell has descriptions
of a bunch of modules: look them
over.


** Custom Data Types**

Define a new data type, Shape

-}

data Shape = Circle Float Float Float | Rectangle Float Float Float Float

{-
The first word is data, then the name of the type (capitalized, then =, then the constructors separated
by pipes)
-}

