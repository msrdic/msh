module Commands ( Command (..)
                , StackDepsSub (..)
                , HSDepsSub (..) ) where

data Command = StackDeps { stackSub :: StackDepsSub } -- requires stack
             | HSDeps { hsdepsSub :: HSDepsSub } -- requires hsdeps
             deriving (Eq, Show)

data StackDepsSub = List -- list all stack dependencies
                  | Check -- check all dependencies
                  deriving (Eq, Show)

data HSDepsSub = Preview -- preview, macos only
               | Dot -- export as dot
               deriving (Eq, Show)
