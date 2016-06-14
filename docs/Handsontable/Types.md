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

#### `Change`

``` purescript
type Change d = { row :: Int, col :: Int, old :: Maybe d, new :: d }
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
Show ChangeSource
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
Show AlterAction
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
Show PopulateMethod
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
Show Direction
```


