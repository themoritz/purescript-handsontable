module Handsontable.Types where

import Prelude (class Show)
import Control.Monad.Eff (kind Effect)
import Data.Maybe (Maybe)

foreign import data HOT :: Effect

foreign import data Handsontable :: Type -> Type
foreign import data CellEditor :: Type

foreign import data MaybeNull :: Type -> Type

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
  , new :: d
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

readChangeSource :: Partial => String -> ChangeSource
readChangeSource "alter"             = ChangeAlter
readChangeSource "empty"             = ChangeEmpty
readChangeSource "edit"              = ChangeEdit
readChangeSource "populateFromArray" = ChangePopulateFromArray
readChangeSource "loadData"          = ChangeLoadData
readChangeSource "autofill"          = ChangeAutofill
readChangeSource "paste"             = ChangePaste
readChangeSource "spliceCol"         = ChangeSpliceCol
readChangeSource "spliceRow"         = ChangeSpliceRow

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

readPopulateMethod :: Partial => String -> PopulateMethod
readPopulateMethod "overwrite"   = Overwrite
readPopulateMethod "shift_down"  = ShiftDown
readPopulateMethod "shift_right" = ShiftRight

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
