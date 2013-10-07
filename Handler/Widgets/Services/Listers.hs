{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Widgets.Services.Listers where

--import qualified Data.Text as T
import Import


-- | This is the ajax access side of the various CRUD routines
listerService :: Widget
listerService  = do 
  toWidget [julius| 
            angular.module('listers',['ngResource']).
                   factory('Listers' ,function ($resource){
                                           "use strict";
                                           var listerService = [];
                                           listerService.locByGroup = $resource("".replace(/(?=:[0-9])/,"\\"),
                                                                                              {},
                                                                                              {remove:{method:'DELETE',isArray:true},
                                                                                               query:{method:'GET',isArray:true},
                                                                                               get:{method:'GET',isArray:true},
                                                                                               save:{method:'POST',isArray:true}}
                                                                                              );
                                              
                                            return listerService;
                            });
                                           

|]

