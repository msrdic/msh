module Main (main) where

import System.Environment ( getArgs )

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
handleCommand (HSDeps Preview) = error "not implemented"
handleCommand (HSDeps Dot) = error "not implemented"

usage :: IO ()
usage = do
  putStrLn "msh <command> <args>"
  putStrLn ""
