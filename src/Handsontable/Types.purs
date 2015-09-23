module Handsontable.Types where

import Prelude

foreign import data HOT :: !

foreign import data Handsontable :: *

type Options dat r = { data :: DataTable dat | r }

type DataTable dat = Array (Array dat)
