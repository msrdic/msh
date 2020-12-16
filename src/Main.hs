module Main where

import System.Environment ( getArgs )

-- the main entry point
main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> usage
    _ -> usage

usage :: IO ()
usage = do
  putStrLn "msh <command> <args>"
  putStrLn ""
