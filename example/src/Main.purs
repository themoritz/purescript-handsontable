module Main where

import Handsontable
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow, log)
import DOM.Event.Event (type_)
import DOM.Event.Types (EventType(..))
import Data.Foldable (for_)
import Data.Function.Uncurried (mkFn3)
import Data.Maybe (Maybe(Nothing, Just))
import Handsontable.Hooks (onBeforeOnCellMouseDown, onAfterChange)
import Handsontable.Types (HOT, AlterAction(InsertRow), Direction(DirectionDown), PopulateMethod(ShiftDown))
import Prelude (Unit, (==), bind, (<>), ($), show, discard)

main :: Eff (hot :: HOT, console :: CONSOLE) Unit
main = do
  hot <- handsontable "handsontable" $
    { data:
      [ [1]
      , [2]
      ]
    , height: 400.0
    , width: 300.0
    , cells: mkFn3 setCellProps
    , columns:
      [ { type: "numeric"
        , format: "0,0.00"
        , language: "en-US"
        }
      , { type: "numeric"
        , format: "0,0.0"
        , language: "en-US"
        }
      ]
    , customBorders:
      [ { range:
          { from:
            { row: 0, col: 0 }
          , to:
            { row: 1, col: 0 }
          }
        , left: { width: 2, color: "red" }
        }
      ]
    }

  hot `onAfterChange` \changes cause -> do
    logShow cause
    for_ changes \change -> do
      log $ "row " <> show change.row <> " col " <> show change.col <> " old " <> show change.old <> " new " <> show change.new
  hot `onBeforeOnCellMouseDown` \ev coords _ ->
    case type_ ev of
      (EventType typ) -> log $ typ <> ": " <> show coords.row <> " " <> show coords.col

  alter InsertRow (Just 0) 2 Nothing false hot
  offset <- colOffset hot
  log $ "offset: " <> show offset
  clear hot
  _ <- colOffset hot
  _ <- countCols hot
  _ <- countEmptyCols false hot
  _ <- countEmptyRows false hot
  _ <- countRenderedCols hot
  _ <- countRenderedRows hot
  _ <- countRows hot
  _ <- countVisibleCols hot
  _ <- countVisibleRows hot
  deselectCell hot
  _ <- getCell 0 0 false hot
  _ <- getCellMeta 0 0 hot
  _ <- getColHeader hot
  _ <- getColWidth 0 hot
  copy <- getCopyableData 0 0 1 1 hot
  log $ "copy: " <> copy
  _ <- getData Nothing hot
  _ <- getDataAtCell 0 0 hot
  _ <- getDataAtCol 0 hot
  _ <- getDataAtRow 0 hot
  _ <- getRowHeader hot
  _ <- getRowHeight 0 hot
  _ <- getSchema hot
  _ <- getSelected hot
  _ <- getSelectedRange hot
  _ <- getSettings hot
  _ <- getSourceDataAtCol 0 hot
  _ <- getSourceDataAtRow 0 hot
  _ <- getValue hot
  _ <- hasColHeaders hot
  _ <- hasRowHeaders hot
  _ <- isEmptyCol 0 hot
  _ <- isEmptyRow 0 hot
  _ <- isListening hot
  listen hot
  loadData [[10]] hot
  _ <- populateFromArray {row: 0, col: 0} [[9]] Nothing Nothing ShiftDown DirectionDown [] hot
  removeCellMeta 0 0 "foo" hot
  render hot
  _ <- rowOffset hot
  _ <- selectCell {row: 0, col: 0} Nothing false false hot
  setCellMeta 0 0 "foo" "bar" hot
  setCellMetaObject 0 0 {readOnly: false} hot
  setDataAtCell 0 0 8 Nothing hot
  spliceCol 0 0 0 [] hot
  spliceRow 0 0 0 [] hot
  unlisten hot
  updateSettings {readOnly: false} false hot
  validateCells hot \val -> logShow val

setCellProps :: forall r. Int -> Int -> { checkedTemplate :: Boolean | r } -> { checkedTemplate :: Boolean | r }
setCellProps row col prop = if row == col
  then prop { checkedTemplate = true }
  else prop { checkedTemplate = false }
