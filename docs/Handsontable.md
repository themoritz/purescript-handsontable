## Module Handsontable

#### `handsontable`

``` purescript
handsontable :: forall eff d r. String -> Options d r -> Eff (hot :: HOT | eff) (Handsontable d)
```

#### `handsontableNode`

``` purescript
handsontableNode :: forall eff d r. HTMLElement -> Options d r -> Eff (hot :: HOT | eff) (Handsontable d)
```

#### `alter`

``` purescript
alter :: forall eff d. AlterAction -> Maybe Int -> Int -> Maybe ChangeSource -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Insert new row(s) above the row at given index:
If the second argument is `Nothing`, the data will be inserted after the last column/row.

`alter action index amount source keepEmpty hot`.

#### `clear`

``` purescript
clear :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Clears the grid.

#### `colOffset`

``` purescript
colOffset :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Get the index of first visible column.

#### `countCols`

``` purescript
countCols :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Returns the total number of columns in the grid.

#### `countEmptyCols`

``` purescript
countEmptyCols :: forall eff d. Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Int
```

Returns number of empty columns. If the `ending` parameter is `true`, returns number of
empty columns at right hand edge of the table.

#### `countEmptyRows`

``` purescript
countEmptyRows :: forall eff d. Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Int
```

Returns number of empty rows. If the `ending` parameter is `true`, returns
number of empty rows at the bottom of the table.

#### `countRenderedCols`

``` purescript
countRenderedCols :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Return the number of visible columns.

#### `countRenderedRows`

``` purescript
countRenderedRows :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Return the number of rendered rows.

#### `countRows`

``` purescript
countRows :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Total number of rows in the grid.

#### `countVisibleCols`

``` purescript
countVisibleCols :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Number of visible columns. Returns `-1` if the table is not visible

#### `countVisibleRows`

``` purescript
countVisibleRows :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Number of visible rows (rendered rows that fully fit inside viewport)

#### `deselectCell`

``` purescript
deselectCell :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Deselects current cell selection in the grid.

#### `destroy`

``` purescript
destroy :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Remove the grid from the DOM.

#### `getCell`

``` purescript
getCell :: forall eff d. Int -> Int -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) (Maybe HTMLElement)
```

Returns the TD element for given `row`, `col` if it is rendered on screen.
Returns `Nothing` if the TD is not rendered on screen (probably because that part of table is not visible).

#### `getCellEditor`

``` purescript
getCellEditor :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) CellEditor
```

Get the cell editor by row and col.

#### `getCellMeta`

``` purescript
getCellMeta :: forall eff d. Int -> Int -> Handsontable d -> Eff (hot :: HOT | eff) Foreign
```

Get cell properties for given row and col.

#### `getColHeader`

``` purescript
getColHeader :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe (Array String))
```

Return column headers (if they are enabled), `Nothing` otherwise.

#### `getColWidth`

``` purescript
getColWidth :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Number
```

Get the width of the given column

#### `getCopyableData`

``` purescript
getCopyableData :: forall eff d. Int -> Int -> Int -> Int -> Handsontable d -> Eff (hot :: HOT | eff) String
```

Get value of selected range. Each column is separated by tab, each row is separated by new line character.

`getCopyableData startRow startCol endRow endCol`

#### `getData`

``` purescript
getData :: forall eff d. Maybe (Tuple Coords Coords) -> Handsontable d -> Eff (hot :: HOT | eff) (DataTable d)
```

Return the current data table (the same that was passed by data configuration option or loadData method).
Optionally you can provide cell range `startCoord`, `endCoord` to get only a fragment of grid data.

#### `getDataAtCell`

``` purescript
getDataAtCell :: forall eff d. Int -> Int -> Handsontable d -> Eff (hot :: HOT | eff) d
```

Return cell value at row, col. row and col are the visible indexes
(note that if columns were reordered or sorted, the current order will be used).

#### `getDataAtCol`

``` purescript
getDataAtCol :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
```

Returns array of column values from the data source. `col` is the visible index of the column.

#### `getDataAtRow`

``` purescript
getDataAtRow :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
```

Returns a single row of the data. `row` is the visible index of the row.

#### `getRowHeader`

``` purescript
getRowHeader :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe (Array String))
```

Return row headers (if they are enabled), `Nothing` otherwise.

#### `getRowHeight`

``` purescript
getRowHeight :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Number
```

Get the height of the given row.

#### `getSchema`

``` purescript
getSchema :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Foreign
```

Get schema provided by constructor settings or if it doesn't exist return schema based on data
structure on the first row.

#### `getSelected`

``` purescript
getSelected :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe (Array Int))
```

Return index of the currently selected cells as an array `[startRow, startCol, endRow, endCol]`.
Start row and start col are the coordinates of the active cell (where the selection was started).

#### `getSelectedRange`

``` purescript
getSelectedRange :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe Foreign)
```

Returns current selection, or `Nothing` if there is no selection.

#### `getSettings`

``` purescript
getSettings :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Foreign
```

Get the current grid settings

#### `getSourceDataAtCol`

``` purescript
getSourceDataAtCol :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
```

Returns array of column values from the data source. `col` is the index of the row in the data source.

#### `getSourceDataAtRow`

``` purescript
getSourceDataAtRow :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) (Array d)
```

Returns a single row of the data. `row` is the index of the row in the data source.

#### `getValue`

``` purescript
getValue :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) (Maybe d)
```

Get the value from the selected cell, `Nothing` if no cell is selected.

#### `hasColHeaders`

``` purescript
hasColHeaders :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Boolean
```

Returns information of this table is configured to display column headers.

#### `hasRowHeaders`

``` purescript
hasRowHeaders :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Boolean
```

Returns information of this table is configured to display row headers.

#### `isEmptyCol`

``` purescript
isEmptyCol :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Boolean
```

Check if col is empty.

#### `isEmptyRow`

``` purescript
isEmptyRow :: forall eff d. Int -> Handsontable d -> Eff (hot :: HOT | eff) Boolean
```

Check if row is empty.

#### `isListening`

``` purescript
isListening :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Boolean
```

Returns true if current Handsontable instance is listening to keyboard input on document body.

#### `listen`

``` purescript
listen :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Listen to keyboard input on document body.

#### `loadData`

``` purescript
loadData :: forall eff d. DataTable d -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Reset all cells in the grid to contain data from the data array.

#### `populateFromArray`

``` purescript
populateFromArray :: forall eff d. Coords -> DataTable d -> Maybe Coords -> Maybe ChangeSource -> PopulateMethod -> Direction -> Array d -> Handsontable d -> Eff (hot :: HOT | eff) (Maybe HTMLElement)
```

Populate cells at position with a 2D input array (e.g. [[1, 2], [3, 4]]):

`populateFromArray start input end source method dir deltas hot`

Use `end` when you want to cut input when certain row/column is reached.
Optional `source` parameter (default value `PopulateFromArray`) is used
to identify this call in the resulting events (beforeChange, afterChange).
Optional method parameter (default value `Overwrite` has the same effect as the `pasteMethod` option.

Returns ending td in populated area, or `Nothing` if no cell was changed.

#### `removeCellMeta`

``` purescript
removeCellMeta :: forall eff d. Int -> Int -> String -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Remove `key` property object from cell meta data corresponding to params of cell at `row`, `col`.

#### `render`

``` purescript
render :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Re-render the table.

#### `rowOffset`

``` purescript
rowOffset :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Int
```

Get the index of the first visible row.

#### `selectCell`

``` purescript
selectCell :: forall eff d. Coords -> Maybe Coords -> Boolean -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Boolean
```

Select cell `start` or maybe range of cells finishing at `end`.
By default, viewport will be scrolled to selection and after selectCell
call instance will be listening to keyboard input on document.

#### `setCellMeta`

``` purescript
setCellMeta :: forall eff d. Int -> Int -> String -> String -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Sets cell meta data object key corresponding to params row, col.

#### `setCellMetaObject`

``` purescript
setCellMetaObject :: forall eff d r. Int -> Int -> {  | r } -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Set cell meta data object prop to corresponding params row, col

#### `setDataAtCell`

``` purescript
setDataAtCell :: forall eff d. Int -> Int -> d -> Maybe ChangeSource -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Set a new value to a cell. `col` is the index of a visible column (note that if columns were reordered,
the current order will be used). `source` is a flag for before/afterChange events.

#### `spliceCol`

``` purescript
spliceCol :: forall eff d. Int -> Int -> Int -> Array d -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Adds/removes data from the column. This function is modelled after JavaScript's Array.splice.

#### `spliceRow`

``` purescript
spliceRow :: forall eff d. Int -> Int -> Int -> Array d -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Adds/removes data from the row. This function is modelled after JavaScript's Array.splice.

#### `unlisten`

``` purescript
unlisten :: forall eff d. Handsontable d -> Eff (hot :: HOT | eff) Unit
```

Stop listening to keyboard input in document body.

#### `updateSettings`

``` purescript
updateSettings :: forall eff d r. {  | r } -> Boolean -> Handsontable d -> Eff (hot :: HOT | eff) Unit
```

#### `validateCells`

``` purescript
validateCells :: forall eff d a. Handsontable d -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

Validates all cells using their validator functions and calls callback when finished. Does not render the view.
If one of cells is invalid callback will be fired with 'valid' arguments as false otherwise true.


