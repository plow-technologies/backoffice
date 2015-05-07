{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application
    ( makeApplication
    , getApplicationDev
    , makeFoundation
    ) where

import Import
import Settings
import qualified Yesod.Core.Types                              as YCT

import Yesod.Auth
import Yesod.Default.Config
import Yesod.Default.Main
import Yesod.Default.Handlers
import Handler.Main
import Data.Default
import Handler.CRUD.Parts
import Network.Wai.Middleware.RequestLogger
import qualified Database.Persist
import Database.Persist.Sql (runMigration)
import Network.HTTP.Client (newManager,defaultManagerSettings)
import Control.Monad.Logger (runLoggingT)
import System.IO (stdout)
import System.Log.FastLogger 
import           Network.Wai.Logger
-- Import all relevant handler modules here.
-- Don't forget to add new modules to your cabal file!
import Handler.Home

-- This line actually creates our YesodDispatch instance. It is the second half
-- of the call to mkYesodData which occurs in Foundation.hs. Please see the
-- comments there for more details.
mkYesodDispatch "App" resourcesApp

-- This function allocates resources (such as a database connection pool),
-- performs initialization and creates a WAI application. This is also the
-- place to put your migrate statements to have automatic database
-- migrations handled by Yesod.
makeApplication :: AppConfig DefaultEnv Extra -> IO Application
makeApplication conf = do
    foundation <- makeFoundation conf

    -- Initialize the logging middleware
    logWare <- mkRequestLogger def
        { outputFormat =
            if development
                then Detailed True
                else Apache FromSocket
        , destination = Logger $ (YCT.loggerSet.appLogger $ foundation)  
        }

    -- Create the WAI application and apply middlewares
    app <- toWaiAppPlain foundation
    return $ logWare app

    -- logWare   = if development then logStdoutDev  -- From old Application.hs version
    --                            else logStdout
mkLogger :: IO YCT.Logger
mkLogger = do
  ls <- newStdoutLoggerSet 4096
  (dcg,_) <- clockDateCacher
  return $ YCT.Logger ls dcg

-- | Loads up any necessary settings, creates your foundation datatype, and
-- performs some initialization.
makeFoundation :: AppConfig DefaultEnv Extra -> IO App
makeFoundation conf = do
    manager <- newManager $ defaultManagerSettings 
    s <- staticSite
    dbconf <- withYamlEnvironment "config/mysql.yml" (appEnv conf)
              Database.Persist.loadConfig >>=
              Database.Persist.applyEnv
    p <- Database.Persist.createPoolConfig (dbconf :: Settings.PersistConf)
    logger <- mkLogger 
    let foundation = App conf s p manager dbconf logger

    -- Perform database migration using our application's logging settings.
    runLoggingT
        (Database.Persist.runPool dbconf (runMigration migrateAll) p)
        (messageLoggerSource foundation logger)

    return foundation

-- for yesod devel
getApplicationDev :: IO (Int, Application)
getApplicationDev =
    defaultDevelApp loader makeApplication
  where
    loader = Yesod.Default.Config.loadConfig (configSettings Development)
        { csParseExtra = parseExtra
        }
