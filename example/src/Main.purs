module Main where

import Prelude

import Control.Monad.Eff.Console
import Data.Function
import Data.Foldable
import Data.Maybe

import Handsontable
import Handsontable.Types
import Handsontable.Hooks

import Data.DOM.Simple.Events

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
        , language: "en"
        }
      , { type: "numeric"
        , format: "0,0.0"
        , language: "en"
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
    print cause
    for_ changes \change -> do
      log $ "row " <> show change.row <> " col " <> show change.col <> " old " <> show change.old <> " new " <> show change.new
  hot `onBeforeOnCellMouseDown` \ev coords _ -> do
    evType <- mouseEventType ev
    log $ show evType <> ": " <> show coords.row <> " " <> show coords.col

  alter InsertRow (Just 0) 2 Nothing false hot
  offset <- colOffset hot
  log $ "offset: " <> show offset
  clear hot
  colOffset hot
  countCols hot
  countEmptyCols false hot
  countEmptyRows false hot
  countRenderedCols hot
  countRenderedRows hot
  countRows hot
  countVisibleCols hot
  countVisibleRows hot
  deselectCell hot
  getCell 0 0 false hot
  getCellMeta 0 0 hot
  getColHeader hot
  getColWidth 0 hot
  copy <- getCopyableData 0 0 1 1 hot
  log $ "copy: " <> copy
  getData Nothing hot
  getDataAtCell 0 0 hot
  getDataAtCol 0 hot
  getDataAtRow 0 hot
  getRowHeader hot
  getRowHeight 0 hot
  getSchema hot
  getSelected hot
  getSelectedRange hot
  getSettings hot
  getSourceDataAtCol 0 hot
  getSourceDataAtRow 0 hot
  getValue hot
  hasColHeaders hot
  hasRowHeaders hot
  isEmptyCol 0 hot
  isEmptyRow 0 hot
  isListening hot
  listen hot
  loadData [[10]] hot
  populateFromArray {row: 0, col: 0} [[9]] Nothing Nothing ShiftDown DirectionDown [] hot
  removeCellMeta 0 0 "foo" hot
  render hot
  rowOffset hot
  selectCell {row: 0, col: 0} Nothing false false hot
  setCellMeta 0 0 "foo" "bar" hot
  setCellMetaObject 0 0 {readOnly: false} hot
  setDataAtCell 0 0 8 Nothing hot
  spliceCol 0 0 0 [] hot
  spliceRow 0 0 0 [] hot
  unlisten hot
  updateSettings {readOnly: false} false hot
  validateCells hot \val -> print val

setCellProps :: forall r. Int -> Int -> { checkedTemplate :: Boolean | r } -> { checkedTemplate :: Boolean | r }
setCellProps row col prop = if row == col
  then prop { checkedTemplate = true }
  else prop { checkedTemplate = false }
