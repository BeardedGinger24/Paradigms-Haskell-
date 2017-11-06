{-
*Command line arguments*

With command line arguments we can pass information into a program before it runs,
and not have to interact with it after it starts running.
	- good for batch scripts

To use command line arguments, we use the module:
System.Environment

It has two IO actions we can use: getArgs and getProgName

A short demo of these functions:

-}

{-
import System.Environment   
import Data.List  
  
main = do  
   args <- getArgs  
   progName <- getProgName  
   putStrLn "The arguments are:"  
   mapM putStrLn args  
   putStrLn "The program name is:"  
   putStrLn progName 

-}

{-
Bind args to getArgs
bind progName to getProgName
Then print to screen


Another app using these functions: todo
It views, adds, and deletes tasks

-}

import System.Environment   
import System.Directory  
import System.IO  
import Data.List  
  
dispatch :: [(String, [String] -> IO ())]  
dispatch =  [ ("add", add)  
            , ("view", view)  
            , ("remove", remove)  
            ]  
   
main = do  
    (command:args) <- getArgs  
    let (Just action) = lookup command dispatch  
    action args  
  
add :: [String] -> IO ()  
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")  
  
view :: [String] -> IO ()  
view [fileName] = do  
    contents <- readFile fileName  
    let todoTasks = lines contents  
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks  
    putStr $ unlines numberedTasks  
  
remove :: [String] -> IO ()  
remove [fileName, numberString] = do  
    handle <- openFile fileName ReadMode  
    (tempName, tempHandle) <- openTempFile "." "temp"  
    contents <- hGetContents handle  
    let number = read numberString  
        todoTasks = lines contents  
        newTodoItems = delete (todoTasks !! number) todoTasks  
    hPutStr tempHandle $ unlines newTodoItems  
    hClose handle  
    hClose tempHandle  
    removeFile fileName  
    renameFile tempName fileName  
