import System.IO
import Data.List
import Data.List.Split
import Data.Tree
import System.Environment   
import System.Directory  

data Student = Student String String String Int deriving (Show)
data TreeNode = EmptyTree | TreeNode Student TreeNode TreeNode  deriving (Show)
 
main = do  
    (file:command:args) <- getArgs
    if command == "search-age"
        then do
            tree <- getTree
            let
                student = makeStudent ["", "" , "", (head args)]
            print (searchAge student tree)

        else if command == "search-name"
            then do
                tree <- getTree
                let
                    student = makeStudent ["", (head args) , "", ""]
                print (searchName student tree)

            else print "invalid input"

getTree = do
    (file:command:args) <- getArgs
    print ("Searching " ++ file ++ " for " ++ (head args))
    handle <- openFile file ReadMode
    contents <- hGetContents handle
    let
        studentstxt = lines contents
        students = map (makeStudent . splitOn ",") studentstxt -- makes a list of
            --students
        tree = foldr treeInsert EmptyTree students   
    return tree

makeStudent :: [String] -> Student
makeStudent (a:b:c:d:_) = Student a b c (read d)

singleton :: Student -> TreeNode 
singleton x = TreeNode x EmptyTree EmptyTree  
  
treeInsert :: Student -> TreeNode -> TreeNode 
treeInsert x EmptyTree = singleton x  
treeInsert (Student a b c x) (TreeNode (Student d e f age2) left right)   
    | x <= age2  = TreeNode (Student d e f age2) (treeInsert (Student a b c x) left) right 
    | x > age2 = TreeNode (Student d e f age2) left (treeInsert (Student a b c x) right)  

    
searchAge :: Student -> TreeNode -> Bool  
searchAge s EmptyTree = False  
searchAge (Student a b c x) (TreeNode (Student d e f age) left right)  
    | x == age = True  
    | x < age  = searchAge (Student d e f x) left  
    | x > age  = searchAge (Student d e f x) right   

searchName :: Student -> TreeNode -> Bool  
searchName s EmptyTree = False  
searchName (Student a ln c d) (TreeNode (Student e ln2 f g) left right)  
    | ln == ln2 = True  
    | otherwise = searchName (Student a ln c d) left || searchName (Student a ln c d) right










