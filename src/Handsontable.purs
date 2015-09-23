module Handsontable
  ( handsontable
  , handsontableNode
  , alter
  , clear
  , colOffset
  , colToProp
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

  , getData

  , updateSettings
  ) where

import Prelude

import Data.Maybe
import Data.Foreign hiding (isNull)
import Data.Function
import Control.Monad.Eff

import Data.DOM.Simple.Types (HTMLElement())

import Handsontable.Types

foreign import handsontableImpl :: forall eff dat r. Fn2 String (Options dat r) (Eff (hot :: HOT | eff) Handsontable)

handsontable :: forall eff dat r. String -> Options dat r -> Eff (hot :: HOT | eff) Handsontable
handsontable el opts = runFn2 handsontableImpl el opts

foreign import handsontableNodeImpl :: forall eff dat r. Fn2 HTMLElement (Options dat r) (Eff (hot :: HOT | eff) Handsontable)

handsontableNode :: forall eff dat r. HTMLElement -> Options dat r -> Eff (hot :: HOT | eff) Handsontable
handsontableNode el opts = runFn2 handsontableNodeImpl el opts

--

foreign import fromJust :: forall a. a -> MaybeNull a
foreign import fromNothing :: forall a. MaybeNull a
foreign import isNull :: forall a. a -> Boolean

maybeToNull :: forall a. Maybe a -> MaybeNull a
maybeToNull (Just x) = fromJust x
maybeToNull Nothing  = fromNothing

nullToMaybe :: forall a. a -> Maybe a
nullToMaybe x = if isNull x then Nothing else Just x

--

foreign import alterImpl :: forall eff. Fn6 String (MaybeNull Int) Int (MaybeNull String) Boolean Handsontable (Eff (hot :: HOT | eff) Unit)

-- | Insert new row(s) above the row at given index:
-- | If the second argument is `Nothing`, the data will be inserted after the last column/row.
-- |
-- | `alter action index amount source keepEmpty hot`.
alter :: forall eff a. AlterAction -> Maybe Int -> Int -> Maybe String -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Unit
alter action index amount source keepEmpty hot = runFn6 alterImpl (show action) (maybeToNull index) amount (maybeToNull source) keepEmpty hot

-- | Clears the grid.
foreign import clear :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Unit

-- | Get the index of first visible column.
foreign import colOffset :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int

-- | Returns the property name that corresponds to the given column index.
foreign import colToProp :: forall eff. Int -> Handsontable -> Eff (hot :: HOT | eff) String

-- | Returns the total number of columns in the grid.
foreign import countCols :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int

-- | Returns number of empty columns. If the `ending` parameter is `true`, returns number of
-- | empty columns at right hand edge of the table.
foreign import countEmptyCols :: forall eff. Boolean -> Handsontable -> Eff (hot :: HOT | eff) Int

-- | Returns number of empty rows. If the `ending` parameter is `true`, returns
-- | number of empty rows at the bottom of the table.
foreign import countEmptyRows :: forall eff. Boolean -> Handsontable -> Eff (hot :: HOT | eff) Int

-- | Return the number of visible columns.
foreign import countRenderedCols :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int

-- | Return the number of rendered rows.
foreign import countRenderedRows :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int

-- | Total number of rows in the grid.
foreign import countRows :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int

-- TODO: wrap return value of -1
-- | Number of visible columns. Returns `-1` if the table is not visible
foreign import countVisibleCols :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int

-- | Number of visible rows (rendered rows that fully fit inside viewport)
foreign import countVisibleRows :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int

-- | Deselects current cell selection in the grid.
foreign import deselectCell :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Unit

-- | Remove the grid from the DOM.
foreign import destroy :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Unit

-- destroyEditor
-- TODO: missing API doc

-- getActiveEditor
-- TODO: missing API doc

-- | Returns the TD element for given `row`, `col` if it is rendered on screen.
-- | Returns `Nothing` if the TD is not rendered on screen (probably because that part of table is not visible).
foreign import getCellImpl :: forall eff. Fn4 Int Int Boolean Handsontable (Eff (hot :: HOT | eff) HTMLElement)

getCell :: forall eff. Int -> Int -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) (Maybe HTMLElement)
getCell row col topmost hot = nullToMaybe <$> runFn4 getCellImpl row col topmost hot

-- TODO: implement FFI for CellEditor
-- | Get the cell editor by row and col.
foreign import getCellEditor :: forall eff. Handsontable -> Eff (hot :: HOT | eff) CellEditor

-- TODO: implement cellProperties ADT
-- | Get cell properties for given row and col.
foreign import getCellMeta :: forall eff. Int -> Int -> Handsontable -> Eff (hot :: HOT | eff) Foreign

foreign import getData :: forall eff dat. Handsontable -> Eff (hot :: HOT | eff) (DataTable dat)

foreign import updateSettingsImpl :: forall eff dat r. Fn3 (Options dat r) Boolean Handsontable (Eff (hot :: HOT | eff) Unit)

updateSettings :: forall eff dat r. Options dat r -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Unit
updateSettings opts init hot = runFn3 updateSettingsImpl opts init hot
