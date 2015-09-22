module Handsontable.Types where

import Prelude

foreign import data HOT :: !

data Handsontable

type DataTable dat = Array (Array dat)
