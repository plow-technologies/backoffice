{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Widgets.Framework where

import Import
-- import Handler.Widgets.Ui.TimePicker
-- import Handler.Widgets.Header
-- import Handler.Widgets.Menu
-- import Handler.Widgets.HighCharts
-- import Handler.Widgets.Fusion
-- import Handler.Widgets.Ui
-- import Handler.Widgets.Content
-- import Handler.Widgets.ContentTypes
import Handler.Widgets.Services.Listers
-- import Handler.Widgets.Services.Dashboard
-- import Handler.Widgets.Services.Content
-- | Angular JS modules
--------------------------------------------------

-- | User services
-- onpingUserModule :: Widget
-- onpingUserModule = do
--   userService
--   toWidget [julius|                        
--             onpingUserModule=angular.module('onpingUser',['onpingUser.services']);
--             |]

-- | Dashboard services 
-- onpingDashboardModule :: Widget 
-- onpingDashboardModule = do 
--   dashboardService
--   toWidget [julius|
--             angular.module('onpingDashboard',['onpingDashboard.services']);
            
-- |]

-- | Content services 
-- onpingContentModule :: Widget 
-- onpingContentModule = do 
--   contentService
--   toWidget [julius|
--             angular.module('onpingContent',['onpingContent.services']);            
-- |]



-- Lister Services
backofficeListerModule :: Widget
backofficeListerModule = do
  listerService
  toWidget [julius|
            angular.module('backoffice.services',['listers']);
|]

-- | Root App for Onping
onpingRouteModule::Widget
onpingRouteModule = do
  toWidget (angularMkClientHandlers "onpingApp.routes" mkHandlerPool)
  toWidget (loadClientControllers clientControllerPool)



onpingAppModule :: Widget
onpingAppModule = do
  backofficeListerModule
  onpingRouteModule
  toWidget [julius|
            onpingAppModule=angular.module('backoffice',['onpingApp.routes','backoffice.services']);
            |]

--------------------------------------------------

frameworkWidget :: Widget
frameworkWidget = do
  -- onpingUserModule
  -- onpingDashboardModule
  -- onpingContentModule  backoffice
  onpingAppModule
  [whamlet|
<div ng-app="backoffice" ng-view>
|]




