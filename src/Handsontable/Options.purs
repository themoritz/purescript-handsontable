module Handsontable.Options where

import Handsontable.Types

type Options dat =
  { allowInsertColumn :: Boolean
  , allowInsertRow :: Boolean
  , allowInvalid :: Boolean
  , allowRemoveColumn :: Boolean
  , allowRemoveRow :: Boolean
  , autoColumnSize :: Boolean -- see doc
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
  , autoColumnSize: false -- see doc
  , data: []
  , height: 300.0
  , width: 400.0
  }
