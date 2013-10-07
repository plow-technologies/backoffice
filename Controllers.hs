{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Controllers ( module Controllers.Types,
                     clientControllerPool 
                   , loadClientControllers
                   ) where               

import Prelude hiding (head,init,last,readFile, tail, writeFile)

import Yesod 
import Foundation
import Controllers.Types

-- |Every new route adds a client controller here and a route in ClientRoutes.hs

clientControllerPool::ControllerPool
clientControllerPool = []
                   






-- |Client Loading command



loadClientControllers :: ControllerPool -> JavascriptUrl (Route App)
loadClientControllers (controller:controllers) = [julius| 
                                       ^{controllerWidget controller}
                                       ^{loadClientControllers controllers}
|]
loadClientControllers [] = [julius| |]
