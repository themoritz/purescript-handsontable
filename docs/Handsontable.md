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
alter :: forall eff a. AlterAction -> Maybe Int -> Int -> Maybe String -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Handsontable
```

If the second argument is `Nothing`, the data will be inserted after the last column/row

#### `updateSettings`

``` purescript
updateSettings :: forall eff dat r. Options dat r -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Handsontable
```


