module Main where

import Prelude

import Control.Monad.Eff.Console

import Handsontable
import Handsontable.Types
import Handsontable.Options
import Handsontable.Hooks


main = do
  hot <- handsontable "handsontable" $ defaultOptions { data = [[1, 2], [3, 4]] }
  hot `onAfterChange` \_ cause -> log cause
  log "created hot node"
