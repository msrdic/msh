module Main (main) where

import System.Environment ( getArgs )
import System.Process (system)

import Commands
    ( StackDepsSub(Check, List),
      Command(HSDeps, StackDeps),
      HSDepsSub(PNG, Preview, Dot, Generic) )

-- the main entry point
main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> usage
    "sdeps":"list":_ -> handleCommand (StackDeps List)
    "sdeps":"check":_ -> handleCommand (StackDeps Check)
    "hsdeps":"preview":_ -> handleCommand (HSDeps Preview)
    "hsdeps":"dot":_ -> handleCommand (HSDeps Dot)
    "hsdeps":"png":[] -> handleCommand (HSDeps (PNG "hsdeps.png")) -- TODO a better default name?
    "hsdeps":"png":name:_ -> handleCommand (HSDeps (PNG name))
    "hsdeps":_ -> handleCommand (HSDeps Generic)
    _ -> usage

handleCommand :: Command -> IO ()
handleCommand (StackDeps List) = error "not implemented"
handleCommand (StackDeps Check) = error "not implemented"
handleCommand (HSDeps Preview) = system "hsdeps . | dot -Tpng | open -a Preview.app -f" >> return ()
handleCommand (HSDeps Dot) = system "hsdeps ." >> return ()
handleCommand (HSDeps Generic) = system "hsdeps ." >> return ()
handleCommand (HSDeps (PNG name)) = system ("hsdeps . | dot -Tpng -o " ++ name) >> return ()

usage :: IO ()
usage = do
  putStrLn "msh <command> <args>"
  putStrLn ""
