## Module Handsontable

#### `handsontable`

``` purescript
handsontable :: forall eff dat r. String -> Options dat r -> Eff (hot :: HOT | eff) Handsontable
```

#### `handsontableNode`

``` purescript
handsontableNode :: forall eff dat r. HTMLElement -> Options dat r -> Eff (hot :: HOT | eff) Handsontable
```

#### `alter`

``` purescript
alter :: forall eff a. AlterAction -> Maybe Int -> Int -> Maybe String -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Unit
```

Insert new row(s) above the row at given index:
If the second argument is `Nothing`, the data will be inserted after the last column/row.

`alter action index amount source keepEmpty hot`.

#### `clear`

``` purescript
clear :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Unit
```

Clears the grid.

#### `colOffset`

``` purescript
colOffset :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int
```

Get the index of first visible column.

#### `colToProp`

``` purescript
colToProp :: forall eff. Int -> Handsontable -> Eff (hot :: HOT | eff) String
```

Returns the property name that corresponds to the given column index.

#### `countCols`

``` purescript
countCols :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int
```

Returns the total number of columns in the grid.

#### `countEmptyCols`

``` purescript
countEmptyCols :: forall eff. Boolean -> Handsontable -> Eff (hot :: HOT | eff) Int
```

Returns number of empty columns. If the `ending` parameter is `true`, returns number of
empty columns at right hand edge of the table.

#### `countEmptyRows`

``` purescript
countEmptyRows :: forall eff. Boolean -> Handsontable -> Eff (hot :: HOT | eff) Int
```

Returns number of empty rows. If the `ending` parameter is `true`, returns
number of empty rows at the bottom of the table.

#### `countRenderedCols`

``` purescript
countRenderedCols :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int
```

Return the number of visible columns.

#### `countRenderedRows`

``` purescript
countRenderedRows :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int
```

Return the number of rendered rows.

#### `countRows`

``` purescript
countRows :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int
```

Total number of rows in the grid.

#### `countVisibleCols`

``` purescript
countVisibleCols :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int
```

#### `countVisibleRows`

``` purescript
countVisibleRows :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Int
```

Number of visible rows (rendered rows that fully fit inside viewport)

#### `deselectCell`

``` purescript
deselectCell :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Unit
```

Deselects current cell selection in the grid.

#### `destroy`

``` purescript
destroy :: forall eff. Handsontable -> Eff (hot :: HOT | eff) Unit
```

Remove the grid from the DOM.

#### `getCell`

``` purescript
getCell :: forall eff. Int -> Int -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) (Maybe HTMLElement)
```

#### `getCellEditor`

``` purescript
getCellEditor :: forall eff. Handsontable -> Eff (hot :: HOT | eff) CellEditor
```

#### `getCellMeta`

``` purescript
getCellMeta :: forall eff. Int -> Int -> Handsontable -> Eff (hot :: HOT | eff) Foreign
```

#### `getData`

``` purescript
getData :: forall eff dat. Handsontable -> Eff (hot :: HOT | eff) (DataTable dat)
```

#### `updateSettings`

``` purescript
updateSettings :: forall eff dat r. Options dat r -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Unit
```


