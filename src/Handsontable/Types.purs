module Handsontable.Types where

import Prelude

foreign import data HOT :: !

foreign import data Handsontable :: *

foreign import data OptAutoColumnSize :: *

type DataTable dat = Array (Array dat)
