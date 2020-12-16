{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_msh (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/mladen/Documents/_code/msh/.stack-work/install/x86_64-osx/4f8a2406eebf7d63f142dea698c9072735746596c938fb072bf6c058a41c9edf/8.8.4/bin"
libdir     = "/Users/mladen/Documents/_code/msh/.stack-work/install/x86_64-osx/4f8a2406eebf7d63f142dea698c9072735746596c938fb072bf6c058a41c9edf/8.8.4/lib/x86_64-osx-ghc-8.8.4/msh-0.1.0.0-S6rJPkD9AX5YQU3VAP3G5-msh"
dynlibdir  = "/Users/mladen/Documents/_code/msh/.stack-work/install/x86_64-osx/4f8a2406eebf7d63f142dea698c9072735746596c938fb072bf6c058a41c9edf/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/mladen/Documents/_code/msh/.stack-work/install/x86_64-osx/4f8a2406eebf7d63f142dea698c9072735746596c938fb072bf6c058a41c9edf/8.8.4/share/x86_64-osx-ghc-8.8.4/msh-0.1.0.0"
libexecdir = "/Users/mladen/Documents/_code/msh/.stack-work/install/x86_64-osx/4f8a2406eebf7d63f142dea698c9072735746596c938fb072bf6c058a41c9edf/8.8.4/libexec/x86_64-osx-ghc-8.8.4/msh-0.1.0.0"
sysconfdir = "/Users/mladen/Documents/_code/msh/.stack-work/install/x86_64-osx/4f8a2406eebf7d63f142dea698c9072735746596c938fb072bf6c058a41c9edf/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "msh_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "msh_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "msh_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "msh_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "msh_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "msh_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
