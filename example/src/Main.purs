module Main where

import Prelude

import Control.Monad.Eff.Console
import Data.Function
import Data.Maybe

import Handsontable
import Handsontable.Types
import Handsontable.Hooks

import Data.DOM.Simple.Events

main = do
  hot <- handsontable "handsontable" $
    { data: [[1, 2], [3, 4]]
    , height: 400.0
    , width: 300.0
    , cells: mkFn3 setCellProps
    , customBorders: [
      { range:
        { from: {row: 0, col: 0 }
        , to:   {row: 1, col: 0 }
        }
        , left: { width: 2, color: "red" }
        }]
    }
  hot `onAfterChange` \_ cause -> do
    case cause of
      ChangeEdit -> log "edited"
      _          -> log "unknown change cause"
  hot `onBeforeOnCellMouseDown` \ev coords _ -> do
    evType <- mouseEventType ev
    log $ (show evType) <> ": " <> (show coords.row) <> " " <> (show coords.col)

  alter InsertRow (Just 0) 2 Nothing false hot

setCellProps :: forall r. Int -> Int -> { checkedTemplate :: Boolean | r } -> { checkedTemplate :: Boolean | r }
setCellProps row col prop = if row == col
  then prop { checkedTemplate = true }
  else prop { checkedTemplate = false }
