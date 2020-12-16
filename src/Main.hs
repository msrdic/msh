module Main (main) where

import System.Environment ( getArgs )
import System.Process (system)

import Commands


-- the main entry point
main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> usage
    "sdeps":"list":_ -> handleCommand (StackDeps List)
    "sdeps":"check":_ -> handleCommand (StackDeps Check)
    "hsdeps":"preview":_ -> handleCommand (HSDeps Preview)
    _ -> usage

handleCommand :: Command -> IO ()
handleCommand (StackDeps List) = error "not implemented"
handleCommand (StackDeps Check) = error "not implemented"
handleCommand (HSDeps Preview) = system "hsdeps . | dot -Tpng | open -a Preview.app -f" >> return ()
handleCommand (HSDeps Dot) = error "not implemented"

usage :: IO ()
usage = do
  putStrLn "msh <command> <args>"
  putStrLn ""
