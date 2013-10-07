{-# LANGUAGE TupleSections, OverloadedStrings #-}
module ClientHandler where 

import Prelude hiding (head,init,last,readFile, tail, writeFile)
import Data.Aeson.Types

import Yesod 
import Foundation


import Controllers 
import ClientRoutes 


data ClientHandler = ClientHandler { 
                                     chRoute :: ClientRoute
                                  , chController::Controller}







type ClientHandlerPool = [ClientHandler]




-- |Client handler combines the Route and the Controller for Angular into a javascript widget that can be loaded into frameworks.
-- |it has to be separated from the other two so that the Controllers can know about routes. 




mkHandlerPool :: ClientHandlerPool
mkHandlerPool = Prelude.zipWith (\r c -> ClientHandler { chRoute = r ,chController = c } ) clientRouteList clientControllerPool 


-- |angularMkClientHandlers does the heavy lifting of assembling the modules to run the
-- template routes

angularMkClientHandlers ::Value -> ClientHandlerPool -> JavascriptUrl (Route App)
angularMkClientHandlers appName handlerList= [julius|
           angular.module(#{appName},[]).
           config(['$routeProvider', function ($routeProvider){
           "use strict";
           $routeProvider.
           ^{angularAddClientRoutes handlerList}
    }]);          
|]





angularAddClientRoutes :: ClientHandlerPool -> JavascriptUrl (Route App)
angularAddClientRoutes (handler:handlers) = [julius|when(#{toJSON (name $ chRoute handler)},{templateUrl:'@{template $ chRoute handler}', controller: #{toJSON (controllerName $ chController handler)}}).
                       ^{angularAddClientRoutes handlers}

|]



angularAddClientRoutes [] = [julius| otherwise({redirectTo:'/'});|]

