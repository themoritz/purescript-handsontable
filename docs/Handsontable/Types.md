## Module Handsontable.Types

#### `HOT`

``` purescript
data HOT :: !
```

#### `Handsontable`

``` purescript
data Handsontable :: *
```

#### `CellEditor`

``` purescript
data CellEditor :: *
```

#### `MaybeNull`

``` purescript
data MaybeNull :: * -> *
```

#### `Options`

``` purescript
type Options dat r = { data :: DataTable dat | r }
```

#### `DataTable`

``` purescript
type DataTable dat = Array (Array dat)
```

#### `Coords`

``` purescript
type Coords = { row :: Int, col :: Int }
```

#### `ChangeSource`

``` purescript
data ChangeSource
  = ChangeAlter
  | ChangeEmpty
  | ChangeEdit
  | ChangePopulateFromArray
  | ChangeLoadData
  | ChangeAutofill
  | ChangePaste
```

#### `readChangeSource`

``` purescript
readChangeSource :: String -> F ChangeSource
```

#### `AlterAction`

``` purescript
data AlterAction
  = InsertRow
  | InsertCol
  | RemoveRow
  | RemoveCol
```

##### Instances
``` purescript
instance showAlterAction :: Show AlterAction
```


