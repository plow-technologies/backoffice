{-# LANGUAGE TupleSections, OverloadedStrings #-}

module Controllers.Types where

-- import Data.Aeson.Types

import Data.Text
import Yesod 
import Foundation

-- |Controllers are intended for ClientRoute controllers
-- Though lots of things have controllers in the Angular World
-- It seems that having special very "Safe" controllers for your routes would make sense



data Controller = Controller {    controllerWidget :: JavascriptUrl (Route App)
                                , controllerName :: Text
                             }                               

makeController :: Text -> JavascriptUrl (Route App) -> Controller 
makeController name jwidget = Controller { controllerWidget = jwidget
                                         ,controllerName = name     
                                        }


type ControllerPool = [Controller]

