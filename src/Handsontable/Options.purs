module Handsontable.Options where

import Handsontable.Types

foreign import autoColumnSizeTrue :: OptAutoColumnSize
foreign import autoColumnSizeFalse :: OptAutoColumnSize
foreign import autoColumnSizeAbsolute :: Int -> OptAutoColumnSize
foreign import autoColumnSizePercentage :: Int -> OptAutoColumnSize

type Options dat =
  { allowInsertColumn :: Boolean
  , allowInsertRow :: Boolean
  , allowInvalid :: Boolean
  , allowRemoveColumn :: Boolean
  , allowRemoveRow :: Boolean
  , autoColumnSize :: OptAutoColumnSize
  -- TODO
  , data :: DataTable dat
  -- TODO
  , width :: Number
  , height :: Number
  }

defaultOptions :: forall dat. Options dat
defaultOptions =
  { allowInsertColumn: true
  , allowInsertRow: true
  , allowInvalid: true
  , allowRemoveColumn: true
  , allowRemoveRow: true
  , autoColumnSize: autoColumnSizeAbsolute 50
  -- TODO
  , data: []
  -- TODO
  , height: 300.0
  , width: 400.0
  }
