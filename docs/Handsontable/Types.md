## Module Handsontable.Types

#### `HOT`

``` purescript
data HOT :: !
```

#### `Handsontable`

``` purescript
data Handsontable :: * -> *
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
type Options d r = { data :: DataTable d | r }
```

#### `DataTable`

``` purescript
type DataTable d = Array (Array d)
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
  | ChangeSpliceCol
  | ChangeSpliceRow
```

##### Instances
``` purescript
instance showChangeSource :: Show ChangeSource
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

#### `PopulateMethod`

``` purescript
data PopulateMethod
  = Overwrite
  | ShiftDown
  | ShiftRight
```

##### Instances
``` purescript
instance showPopulateMethod :: Show PopulateMethod
```

#### `readPopulateMethod`

``` purescript
readPopulateMethod :: String -> F PopulateMethod
```

#### `Direction`

``` purescript
data Direction
  = DirectionLeft
  | DirectionRight
  | DirectionUp
  | DirectionDown
```

##### Instances
``` purescript
instance showDirection :: Show Direction
```


