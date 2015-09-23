module Handsontable.Types where

import Prelude

import Data.Either
import Data.Foreign
import Data.Foreign.Class

foreign import data HOT :: !

foreign import data Handsontable :: *

type Options dat r = { data :: DataTable dat | r }

type DataTable dat = Array (Array dat)

type Coords =
  { row :: Int
  , col :: Int
  }

data ChangeSource
  = ChangeAlter
  | ChangeEmpty
  | ChangeEdit
  | ChangePopulateFromArray
  | ChangeLoadData
  | ChangeAutofill
  | ChangePaste

readChangeSource :: String -> F ChangeSource
readChangeSource "alter"             = pure ChangeAlter
readChangeSource "empty"             = pure ChangeEmpty
readChangeSource "edit"              = pure ChangeEdit
readChangeSource "populateFromArray" = pure ChangePopulateFromArray
readChangeSource "loadData"          = pure ChangeLoadData
readChangeSource "autofill"          = pure ChangeAutofill
readChangeSource "paste"             = pure ChangePaste
readChangeSource s                   = Left $ TypeMismatch ("'" ++ s ++ "'") " a valid change cause value"
