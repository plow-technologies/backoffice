{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.Main where

import Handler.Widgets.Framework
import Import

getMainR :: Handler Html
getMainR = controllerDefaultLayout $ do
  [whamlet|
 <div .content>
    <div .page-header> 
        <h1> Plow Technologies 
          <small> Backoffice System 
    <div .row> 
       <div .col-lg-2 > 
         <div .list-group>
             <a href="#"  .list-group-item .active> 
                 <h4> Work Orders
             <a href="#"  .list-group-item > 
                 <h4> Products 
             <a href="#"  .list-group-item > 
                 <h4> Inventory
             <a href="#"  .list-group-item > 
                 <h4> Locations 
             <a href="#"  .list-group-item > 
                 <h4> Purchase Orders
             <a href="#"  .list-group-item > 
                 <h4> Field Service Orders 
             <a href="#"  .list-group-item > 
                 <h4> Repair Shop Item 

      <div .col-lg-10>
       <table .table .table-hover> 
         <tr ng-repeat="row in testTable"> 
           <td ng-repeat="cell in row"> 
              {{cell}}
        
|]   
