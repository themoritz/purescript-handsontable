module Handsontable.Types where

import Prelude

import Data.Either
import Data.Maybe
import Data.Foreign
import Data.Foreign.Class

foreign import data HOT :: !

foreign import data Handsontable :: * -> *
foreign import data CellEditor :: *

foreign import data MaybeNull :: * -> *

type Options d r = { data :: DataTable d | r }

type DataTable d = Array (Array d)

type Coords =
  { row :: Int
  , col :: Int
  }

type Change d =
  { row :: Int
  , col :: Int
  , old :: Maybe d
  , new :: String
  }

data ChangeSource
  = ChangeAlter
  | ChangeEmpty
  | ChangeEdit
  | ChangePopulateFromArray
  | ChangeLoadData
  | ChangeAutofill
  | ChangePaste
  | ChangeSpliceCol
  | ChangeSpliceRow

instance showChangeSource :: Show ChangeSource where
  show ChangeAlter             = "alter"
  show ChangeEmpty             = "empty"
  show ChangeEdit              = "edit"
  show ChangePopulateFromArray = "populateFromArray"
  show ChangeLoadData          = "loadData"
  show ChangeAutofill          = "autofill"
  show ChangePaste             = "paste"
  show ChangeSpliceCol         = "spliceCol"
  show ChangeSpliceRow         = "spliceRow"

readChangeSource :: String -> F ChangeSource
readChangeSource "alter"             = pure ChangeAlter
readChangeSource "empty"             = pure ChangeEmpty
readChangeSource "edit"              = pure ChangeEdit
readChangeSource "populateFromArray" = pure ChangePopulateFromArray
readChangeSource "loadData"          = pure ChangeLoadData
readChangeSource "autofill"          = pure ChangeAutofill
readChangeSource "paste"             = pure ChangePaste
readChangeSource "spliceCol"         = pure ChangeSpliceCol
readChangeSource "spliceRow"         = pure ChangeSpliceRow
readChangeSource s                   = Left $ TypeMismatch ("'" ++ s ++ "'") " a valid change cause value"

data AlterAction
  = InsertRow
  | InsertCol
  | RemoveRow
  | RemoveCol

instance showAlterAction :: Show AlterAction where
  show InsertRow = "insert_row"
  show InsertCol = "insert_col"
  show RemoveRow = "remove_row"
  show RemoveCol = "remove_col"

data PopulateMethod
  = Overwrite
  | ShiftDown
  | ShiftRight

instance showPopulateMethod :: Show PopulateMethod where
  show Overwrite  = "overwrite"
  show ShiftDown  = "shift_down"
  show ShiftRight = "shift_right"

readPopulateMethod :: String -> F PopulateMethod
readPopulateMethod "overwrite"  = pure Overwrite
readPopulateMethod "shift_down" = pure ShiftDown
readPopulateMethod "shift_right" = pure ShiftRight
readPopulateMethod s             = Left $ TypeMismatch ("'" ++ s ++ "'") " a valid populate method value"

data Direction
  = DirectionLeft
  | DirectionRight
  | DirectionUp
  | DirectionDown

instance showDirection :: Show Direction where
  show DirectionLeft  = "left"
  show DirectionRight = "right"
  show DirectionUp    = "up"
  show DirectionDown  = "down"
