import System.IO
import Data.List
import Data.List.Split
import Data.Tree

{-

1. 5pts) Implement a data type called student. 
The student type has three fields, first name, last name, major, and age. 

2. 5 pts) Implement a tree node type that has a student as 
one of its fields. The tree will be a binary search tree on the attribute age.

3. 1 pt) Write a comma separated file in which each line (ended by new line character) contains a 
student, with its fields separated by commas

4. Write a program that will:

a. 5pts) Read the comma separated file (specified by a command line argument) 
and produce a list of students.

b. 5pts) Construct a binary search tree using the ages of students.

c. 3pts) Write a function that will search through the tree to see if it 
contains a student of age x. It returns true if there is, otherwise it 
returns false.

d. 4pts) Write a function that takes a string for last name uses depth-first 
search to find if a student with that name is in the tree.

Do all except the csv file of students in a single Haskell program. Upload 
the Haskell file and the csv file here.-}

data Student = Student String String String Int deriving (Show)
data TreeNode = EmptyTree | TreeNode Student TreeNode TreeNode  deriving (Show)

main = do
    handle <- openFile "students.csv" ReadMode
    contents <- hGetContents handle
    let studentstxt = lines contents
        students = map (makeStudent . splitOn ",") studentstxt
        tree = foldr treeInsert EmptyTree students
    print tree
    hClose handle


makeStudent :: [String] -> Student
makeStudent (a:b:c:d:_) = Student a b c (read d)

studentToString :: Student -> String
studentToString (Student a b c d) = a ++ b ++ c ++ (show d)

singleton :: Student -> TreeNode 
singleton x = TreeNode x EmptyTree EmptyTree  
  
treeInsert :: Student -> TreeNode -> TreeNode 
treeInsert x EmptyTree = singleton x  
treeInsert (Student a b c x) (TreeNode (Student d e f age2) left right)   
    | x <= age2  = TreeNode (Student d e f age2) (treeInsert (Student a b c x) left) right 
    | x > age2 = TreeNode (Student d e f age2) left (treeInsert (Student a b c x) right)  
    




