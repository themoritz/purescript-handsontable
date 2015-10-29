module Handsontable
  ( handsontable
  , handsontableNode
  , alter
  , clear
  , colOffset
  -- , colToProp
  , countCols
  , countEmptyCols
  , countEmptyRows
  , countRenderedCols
  , countRenderedRows
  , countRows
  , countVisibleCols
  , countVisibleRows
  , deselectCell
  , destroy
  -- , destroyEditor
  -- , getActiveEditor
  , getCell
  , getCellEditor
  , getCellMeta
  -- , getCellRenderer
  -- , getCellValidator
  , getColHeader
  , getColWidth
  -- , getCoords
  , getCopyableData
  , getData
  , getDataAtCell
  , getDataAtCol
  -- , getDataAtProp
  , getDataAtRow
  -- , getDataAtRowProp
  -- , getInstance
  -- , getPlugin
  , getRowHeader
  , getRowHeight
  , getSchema
  , getSelected
  , getSelectedRange
  , getSettings
  , getSourceDataAtCol
  , getSourceDataAtRow
  , getValue
  , hasColHeaders
  , hasRowHeaders
  , isEmptyCol
  , isEmptyRow
  , isListening
  , listen
  , loadData
  , populateFromArray
  -- , propToCol
  , removeCellMeta
  -- , removeHook
  , render
  , rowOffset
  -- , runHooks
  , selectCell
  -- , selectCellByProp
  , setCellMeta
  , setCellMetaObject
  , setDataAtCell
  -- , setDataAtRowProp
  , spliceCol
  , spliceRow
  -- , translateColIndex
  -- , translateRowIndex
  , unlisten
  , updateSettings
  , validateCells
  ) where

import Prelude

import Control.Monad.Eff

import Data.Maybe
import Data.Tuple
import Data.Foreign hiding (isNull)
import Data.Function
import Data.Nullable

import DOM.HTML.Types (HTMLElement())

import Handsontable.Types

foreign import handsontableImpl :: forall eff d r. Fn2 String (Options d r) (Eff (hot :: HOT | eff) (Handsontable d))

handsontable :: forall eff d r. String -> Options d r -> Eff (hot :: HOT | eff) (Handsontable d)
handsontable el opts = runFn2 handsontableImpl el opts

foreign import handsontableNodeImpl :: forall eff d r. Fn2 HTMLElement (Options d r) (Eff (hot :: HOT | eff) (Handsontable d))

handsontableNode :: forall eff d r. HTMLElement -> Options d r -> Eff (hot :: HOT | eff) (Handsontable d)
handsontableNode el opts = runFn2 handsontableNodeImpl el opts

--

foreign import alterImpl :: forall eff d. Fn6 String (Nullable Int) Int (Nullable String) Boolean (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Insert new row(s) above the row at given index:
-- | If the second argument is `Nothing`, the data will be inserted after the last column/row.
-- |
-- | `alter action index amount source keepEmpty hot`.
alter :: forall eff d a. AlterAction -> Maybe Int -> Int -> Maybe ChangeSource -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Unit
alter action index amount source keepEmpty hot = runFn6 alterImpl (show action) (toNullable index) amount (toNullable $ show <$> source) keepEmpty hot

-- | Clears the grid.
foreign import clear :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit

-- | Get the index of first visible column.
foreign import colOffset :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

-- colToProp
-- TODO: does not make sense to implement given we only support array data atm.

-- | Returns the total number of columns in the grid.
foreign import countCols :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

foreign import countEmptyColsImpl :: forall eff d. Fn2 Boolean (Handsontable d) (Eff (hot :: HOT | eff) Int)

-- | Returns number of empty columns. If the `ending` parameter is `true`, returns number of
-- | empty columns at right hand edge of the table.
countEmptyCols :: forall eff d. Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Int
countEmptyCols ending hot = runFn2 countEmptyColsImpl ending hot

foreign import countEmptyRowsImpl :: forall eff d. Fn2 Boolean (Handsontable d) (Eff (hot :: HOT | eff) Int)

-- | Returns number of empty rows. If the `ending` parameter is `true`, returns
-- | number of empty rows at the bottom of the table.
countEmptyRows :: forall eff d. Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Int
countEmptyRows ending hot = runFn2 countEmptyRowsImpl ending hot

-- | Return the number of visible columns.
foreign import countRenderedCols :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

-- | Return the number of rendered rows.
foreign import countRenderedRows :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

-- | Total number of rows in the grid.
foreign import countRows :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

-- TODO: wrap return value of -1
-- | Number of visible columns. Returns `-1` if the table is not visible
foreign import countVisibleCols :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

-- | Number of visible rows (rendered rows that fully fit inside viewport)
foreign import countVisibleRows :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

-- | Deselects current cell selection in the grid.
foreign import deselectCell :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit

-- | Remove the grid from the DOM.
foreign import destroy :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit

-- destroyEditor
-- TODO: missing API doc

-- getActiveEditor
-- TODO: missing API doc

foreign import getCellImpl :: forall eff d. Fn4 Int Int Boolean (Handsontable d) (Eff (hot :: HOT | eff) (Nullable HTMLElement))

-- | Returns the TD element for given `row`, `col` if it is rendered on screen.
-- | Returns `Nothing` if the TD is not rendered on screen (probably because that part of table is not visible).
getCell :: forall eff d. Int -> Int -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) (Maybe HTMLElement)
getCell row col topmost hot = toMaybe <$> runFn4 getCellImpl row col topmost hot

-- TODO: implement FFI for CellEditor
-- | Get the cell editor by row and col.
foreign import getCellEditor :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) CellEditor

-- TODO: implement cellProperties ADT
foreign import getCellMetaImpl :: forall eff d. Fn3 Int Int (Handsontable d) (Eff (hot :: HOT | eff) Foreign)

-- | Get cell properties for given row and col.
getCellMeta :: forall eff d. Int -> Int -> Handsontable d -> Eff (hot :: HOT | eff) Foreign
getCellMeta row col hot = runFn3 getCellMetaImpl row col hot

-- getCellRenderer
-- TODO: signature of the function that is returned?

-- getCellValidator
-- TODO: signature of the function that is returned?

foreign import getColHeaderImpl :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Nullable (Array String))

-- | Return column headers (if they are enabled), `Nothing` otherwise.
getColHeader :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe (Array String))
getColHeader hot = toMaybe <$> getColHeaderImpl hot

foreign import getColWidthImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) Number)

-- | Get the width of the given column
getColWidth :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Number
getColWidth col hot = runFn2 getColWidthImpl col hot

-- getCoords
-- TODO: What is an "element" here?

foreign import getCopyableDataImpl :: forall eff d. Fn5 Int Int Int Int (Handsontable d) (Eff (hot :: HOT | eff) String)

-- | Get value of selected range. Each column is separated by tab, each row is separated by new line character.
-- |
-- | `getCopyableData startRow startCol endRow endCol`
getCopyableData :: forall eff d. Int -> Int -> Int -> Int -> Handsontable d -> Eff (hot :: HOT | eff) String
getCopyableData row1 col1 row2 col2 hot = runFn5 getCopyableDataImpl row1 col1 row2 col2 hot

foreign import getDataAllImpl :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (DataTable d)
foreign import getDataSubImpl :: forall eff d. Fn5 Int Int Int Int (Handsontable d) (Eff (hot :: HOT | eff) (DataTable d))

-- | Return the current data table (the same that was passed by data configuration option or loadData method).
-- | Optionally you can provide cell range `startCoord`, `endCoord` to get only a fragment of grid data.
getData :: forall eff d. Maybe (Tuple Coords Coords) -> Handsontable d -> Eff (hot :: HOT | eff) (DataTable d)
getData Nothing hot              = getDataAllImpl hot
getData (Just (Tuple c1 c2)) hot = runFn5 getDataSubImpl c1.row c1.col c2.row c2.col hot

foreign import getDataAtCellImpl :: forall eff d. Fn3 Int Int (Handsontable d) (Eff (hot :: HOT | eff) d)

-- | Return cell value at row, col. row and col are the visible indexes
-- | (note that if columns were reordered or sorted, the current order will be used).
getDataAtCell :: forall eff d. Int -> Int -> Handsontable d -> Eff (hot :: HOT | eff) d
getDataAtCell row col hot = runFn3 getDataAtCellImpl row col hot

foreign import getDataAtColImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) (Array d))

-- | Returns array of column values from the data source. `col` is the visible index of the column.
getDataAtCol :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
getDataAtCol col hot = runFn2 getDataAtColImpl col hot

-- getDataAtProp
-- TODO: does not make sense to implement given we only support array data atm.

foreign import getDataAtRowImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) (Array d))

-- | Returns a single row of the data. `row` is the visible index of the row.
getDataAtRow :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
getDataAtRow row hot = runFn2 getDataAtRowImpl row hot

-- getDataAtRowProp
-- TODO: does not make sense to implement given we only support array data atm.

-- getInstance
-- Remark: does not make sense for ffi?

-- getPlugin
-- TODO: In what way does it make sense to build interface to plugins?

foreign import getRowHeaderImpl :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Nullable (Array String))

-- | Return row headers (if they are enabled), `Nothing` otherwise.
getRowHeader :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe (Array String))
getRowHeader hot = toMaybe <$> getRowHeaderImpl hot

foreign import getRowHeightImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) Number)

-- | Get the height of the given row.
getRowHeight :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Number
getRowHeight row hot = runFn2 getRowHeightImpl row hot

-- | Get schema provided by constructor settings or if it doesn't exist return schema based on data
-- | structure on the first row.
foreign import getSchema :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Foreign

foreign import getSelectedImpl :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Nullable (Array Int))

-- | Return index of the currently selected cells as an array `[startRow, startCol, endRow, endCol]`.
-- | Start row and start col are the coordinates of the active cell (where the selection was started).
getSelected :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe (Array Int))
getSelected hot = toMaybe <$> getSelectedImpl hot

-- TODO: Convert WalkontableCelLRange to tuple of Coords
foreign import getSelectedRangeImpl :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Nullable Foreign)

-- | Returns current selection, or `Nothing` if there is no selection.
getSelectedRange :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe Foreign)
getSelectedRange hot = toMaybe <$> getSelectedRangeImpl hot

-- | Get the current grid settings
foreign import getSettings :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Foreign

foreign import getSourceDataAtColImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) (Array d))

-- | Returns array of column values from the data source. `col` is the index of the row in the data source.
getSourceDataAtCol :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
getSourceDataAtCol col hot = runFn2 getSourceDataAtColImpl col hot

foreign import getSourceDataAtRowImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) (Array d))

-- | Returns a single row of the data. `row` is the index of the row in the data source.
getSourceDataAtRow :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
getSourceDataAtRow row hot = runFn2 getSourceDataAtRowImpl row hot

foreign import getValueImpl :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Nullable d)

-- | Get the value from the selected cell, `Nothing` if no cell is selected.
getValue :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe d)
getValue hot = toMaybe <$> getValueImpl hot

-- | Returns information of this table is configured to display column headers.
foreign import hasColHeaders :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Boolean

-- | Returns information of this table is configured to display row headers.
foreign import hasRowHeaders :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Boolean

foreign import isEmptyColImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) Boolean)

-- | Check if col is empty.
isEmptyCol :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Boolean
isEmptyCol col hot = runFn2 isEmptyColImpl col hot

foreign import isEmptyRowImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) Boolean)

-- | Check if row is empty.
isEmptyRow :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Boolean
isEmptyRow row hot = runFn2 isEmptyRowImpl row hot

-- | Returns true if current Handsontable instance is listening to keyboard input on document body.
foreign import isListening :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Boolean

-- | Listen to keyboard input on document body.
foreign import listen :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit

foreign import loadDataImpl :: forall eff d. Fn2 (DataTable d) (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Reset all cells in the grid to contain data from the data array.
loadData :: forall eff d. DataTable d -> Handsontable d -> Eff (hot :: HOT | eff) Unit
loadData dat hot = runFn2 loadDataImpl dat hot

foreign import populateFromArrayImpl :: forall eff d. Fn10 Int Int (DataTable d) (Nullable Int) (Nullable Int) (Nullable String) String String (Array d) (Handsontable d) (Eff (hot :: HOT | eff) (Nullable HTMLElement))

-- | Populate cells at position with a 2D input array (e.g. [[1, 2], [3, 4]]):
-- |
-- | `populateFromArray start input end source method dir deltas hot`
-- |
-- | Use `end` when you want to cut input when certain row/column is reached.
-- | Optional `source` parameter (default value `PopulateFromArray`) is used
-- | to identify this call in the resulting events (beforeChange, afterChange).
-- | Optional method parameter (default value `Overwrite` has the same effect as the `pasteMethod` option.
-- |
-- | Returns ending td in populated area, or `Nothing` if no cell was changed.
populateFromArray :: forall eff d. Coords -> DataTable d -> Maybe Coords -> Maybe ChangeSource -> PopulateMethod -> Direction -> Array d -> Handsontable d -> Eff (hot :: HOT | eff) (Maybe HTMLElement)
populateFromArray start input mEnd mSource method dir deltas hot =
  toMaybe <$> runFn10 populateFromArrayImpl start.row start.col input
                (toNullable $ _.row <$> mEnd) (toNullable $ _.col <$> mEnd)
                (toNullable $ show <$> mSource) (show method) (show dir) deltas hot

-- propToCol
-- TODO: does not make sense to implement given we only support array data atm.

foreign import removeCellMetaImpl :: forall eff d. Fn4 Int Int String (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Remove `key` property object from cell meta data corresponding to params of cell at `row`, `col`.
removeCellMeta :: forall eff d. Int -> Int -> String -> Handsontable d -> Eff (hot :: HOT | eff) Unit
removeCellMeta row col key hot = runFn4 removeCellMetaImpl row col key hot

-- removeHook
-- TODO: does not make senes for this ffi?

-- | Re-render the table.
foreign import render :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit

-- | Get the index of the first visible row.
foreign import rowOffset :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int

-- runHooks
-- TODO: does not make senes for this ffi?

foreign import selectCellImpl :: forall eff d. Fn7 Int Int (Nullable Int) (Nullable Int) Boolean Boolean (Handsontable d) (Eff (hot :: HOT | eff) Boolean)

-- | Select cell `start` or maybe range of cells finishing at `end`.
-- | By default, viewport will be scrolled to selection and after selectCell
-- | call instance will be listening to keyboard input on document.
selectCell :: forall eff d. Coords -> Maybe Coords -> Boolean -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Boolean
selectCell start mEnd scrollToCell changeListener hot =
  runFn7 selectCellImpl start.row start.col (toNullable $ _.row <$> mEnd) (toNullable $ _.col <$> mEnd) scrollToCell changeListener hot

-- selectCellByProp
-- TODO: does not make sense to implement given we only support array data atm.

foreign import setCellMetaImpl :: forall eff d. Fn5 Int Int String String (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Sets cell meta data object key corresponding to params row, col.
setCellMeta :: forall eff d. Int -> Int -> String -> String -> Handsontable d -> Eff (hot :: HOT | eff) Unit
setCellMeta row col key val hot = runFn5 setCellMetaImpl row col key val hot

foreign import setCellMetaObjectImpl :: forall eff d r. Fn4 Int Int { | r } (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Set cell meta data object prop to corresponding params row, col
setCellMetaObject :: forall eff d r. Int -> Int -> { | r } -> Handsontable d -> Eff (hot :: HOT | eff) Unit
setCellMetaObject row col props hot = runFn4 setCellMetaObjectImpl row col props hot

foreign import setDataAtCellImpl :: forall eff d. Fn5 Int Int d (Nullable String) (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Set a new value to a cell. `col` is the index of a visible column (note that if columns were reordered,
-- | the current order will be used). `source` is a flag for before/afterChange events.
setDataAtCell :: forall eff d. Int -> Int -> d -> Maybe ChangeSource -> Handsontable d -> Eff (hot :: HOT | eff) Unit
setDataAtCell row col val mSource hot = runFn5 setDataAtCellImpl row col val (toNullable $ show <$> mSource) hot

-- setDataAtRowProp
-- TODO: does not make sense to implement given we only support array data atm.

foreign import spliceColImpl :: forall eff d. Fn5 Int Int Int (Array d) (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Adds/removes data from the column. This function is modelled after JavaScript's Array.splice.
spliceCol :: forall eff d. Int -> Int -> Int -> Array d -> Handsontable d -> Eff (hot :: HOT | eff) Unit
spliceCol col index amount elems hot = runFn5 spliceColImpl col index amount elems hot

foreign import spliceRowImpl :: forall eff d. Fn5 Int Int Int (Array d) (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Adds/removes data from the row. This function is modelled after JavaScript's Array.splice.
spliceRow :: forall eff d. Int -> Int -> Int -> Array d -> Handsontable d -> Eff (hot :: HOT | eff) Unit
spliceRow row index amount elems hot = runFn5 spliceRowImpl row index amount elems hot

foreign import translateColIndexImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) Int)

-- TODO: seems to be in doc but not in actual API
-- | If displayed columns order is different than the order of columns stored in memory
-- | (i.e. column were moved using manualColumnMove plugin) we need to translate logical (stored)
-- | column index to physical (displayed) index.
translateColIndex :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Int
translateColIndex col hot = runFn2 translateColIndexImpl col hot

foreign import translateRowIndexImpl :: forall eff d. Fn2 Int (Handsontable d) (Eff (hot :: HOT | eff) Int)

-- TODO: seems to be in doc but not in actual API
-- | If displayed rows order is different than the order of rows stored in memory (i.e. sorting is applied)
-- | we need to translate logical (stored) row index to physical (displayed) index.
translateRowIndex :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Int
translateRowIndex row hot = runFn2 translateRowIndexImpl row hot

-- | Stop listening to keyboard input in document body.
foreign import unlisten :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit

foreign import updateSettingsImpl :: forall eff d r. Fn3 { | r } Boolean (Handsontable d) (Eff (hot :: HOT | eff) Unit)

updateSettings :: forall eff d r. { | r } -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Unit
updateSettings opts init hot = runFn3 updateSettingsImpl opts init hot

foreign import validateCellsImpl :: forall eff d a. Fn2 (Boolean -> Eff (hot :: HOT | eff) a) (Handsontable d) (Eff (hot :: HOT | eff) Unit)

-- | Validates all cells using their validator functions and calls callback when finished. Does not render the view.
-- | If one of cells is invalid callback will be fired with 'valid' arguments as false otherwise true.
validateCells :: forall eff d a. Handsontable d -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
validateCells hot fn = runFn2 validateCellsImpl fn hot
