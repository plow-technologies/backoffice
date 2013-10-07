{-# LANGUAGE TupleSections, OverloadedStrings #-}
module ClientRoutes where

import Prelude hiding (head,init,last,readFile, tail, writeFile)
--import Data.Aeson.Types
import Data.Text
import Yesod 
import Foundation


-- |Client Routes are those routes which are rendered client side instead
-- of serverside... Angular handles the view and they are superceded with a '#'




clientRouteList :: [ClientRoute]
clientRouteList = [mainCR]
-- ==================================================
-- Routes Start
-- ==================================================

mainCR :: ClientRoute
mainCR = ClientRoute {
           name = "/:dashId"
         , template = MainR 
         , base = HomeR

         }






-- ==================================================
-- END OF ROUTES
-- ==================================================


-- | Client Route builders


data ClientRoute = ClientRoute { 
                                  name :: Text
                               ,template :: Route App 
                               ,base :: Route App

                                
                               }



type ClientRoutePool = [ClientRoute]




testRoute :: Text
testRoute = "new Test"

renderRouteString :: ClientRoute -> Value 
renderRouteString x = String (name x)

-- | Client Route parm in Angular always start with the character ":"
-- all formatting needs to be done away from unit
renderRouteParmString :: ClientRoute ->Text-> Value 
renderRouteParmString rt txt = String $ (Data.Text.append.(Data.Text.takeWhile notEscape).name $ rt) txt
                               where notEscape::Char -> Bool
                                     notEscape = (\x ->  x /= ':')
                                                        

redirectCR :: ClientRoute -> HandlerT App IO a
redirectCR targetCR = do
  txtRouteGetter <- getUrlRender
  redirect $ (txtRouteGetter $ base targetCR ) `Data.Text.append`  "#"  `Data.Text.append` ( name targetCR )


genCRText :: ClientRoute -> Text
genCRText targetCR = "#"  `Data.Text.append` ( name targetCR )


