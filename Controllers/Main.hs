{-# LANGUAGE TupleSections, OverloadedStrings #-}

module Controllers.Main where


import Yesod 
import Controllers.Types
import ClientRoutes
-- |Controllers are intended for ClientRoute controllers
-- Though lots of things have controllers in the Angular World
-- It seems that having special very "Safe" controllers for your routes would make sense


mainController :: Controller
mainController = makeController uad ctrl 
                    where 
                      uad = "MainController"
                      ctrl = [julius|
function MainController ($scope) {
  "use strict";                                




$scope.testRow = {};

$scope.testRow.cell0  = "data0  "; 
$scope.testRow.cell1  = "data1  "; 
$scope.testRow.cell2  = "data2  "; 
$scope.testRow.cell3  = "data3  "; 
$scope.testRow.cell4  = "data4  "; 
$scope.testRow.cell5  = "data5  "; 
$scope.testRow.cell6  = "data6  "; 
$scope.testRow.cell7  = "data7  "; 
$scope.testRow.cell8  = "data8  "; 
$scope.testRow.cell9  = "data9  ";   
$scope.testRow.cell10 = "data10";
$scope.testRow.cell11 = "data11";
$scope.testRow.cell12 = "data12";
$scope.testRow.cell13 = "data13";
$scope.testRow.cell14 = "data14";
$scope.testRow.cell15 = "data15";
$scope.testRow.cell16 = "data16";
$scope.testRow.cell17 = "data17";
$scope.testRow.cell18 = "data18";
$scope.testRow.cell19 = "data19";
$scope.testRow.cell20 = "data20";
$scope.testRow.cell21 = "data210";


$scope.testTable = {};
$scope.testTable.row0  = $scope.testRow;         
$scope.testTable.row1  = $scope.testRow;         
$scope.testTable.row2  = $scope.testRow;         
$scope.testTable.row3  = $scope.testRow;         
$scope.testTable.row4  = $scope.testRow;         
$scope.testTable.row5  = $scope.testRow;         
$scope.testTable.row6  = $scope.testRow;         
$scope.testTable.row7  = $scope.testRow;         
$scope.testTable.row8  = $scope.testRow;         
$scope.testTable.row9  = $scope.testRow;         
$scope.testTable.row10 = $scope.testRow;          
$scope.testTable.row11 = $scope.testRow;          
$scope.testTable.row12 = $scope.testRow;          
$scope.testTable.row13 = $scope.testRow;          
$scope.testTable.row14 = $scope.testRow;          
$scope.testTable.row15 = $scope.testRow;          
$scope.testTable.row16 = $scope.testRow;          
$scope.testTable.row17 = $scope.testRow;          
$scope.testTable.row18 = $scope.testRow;          
$scope.testTable.row19 = $scope.testRow;          
$scope.testTable.row20 = $scope.testRow;          
$scope.testTable.row21 = $scope.testRow;          
$scope.testTable.row22 = $scope.testRow;          
$scope.testTable.row23 = $scope.testRow;          
$scope.testTable.row24 = $scope.testRow;          
$scope.testTable.row25 = $scope.testRow;          
$scope.testTable.row26 = $scope.testRow;          
$scope.testTable.row27 = $scope.testRow;          



  
}
|]
