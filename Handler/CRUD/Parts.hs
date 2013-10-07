{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.CRUD.Parts where
import Data.Aeson (ToJSON)
import Data.Maybe
import Import


-- | /crud/parts CrudPartsR GET

getCrudPartsR :: Handler Value
getCrudPartsR = return $ toJSON err
  where err :: Text
        err = "test"
