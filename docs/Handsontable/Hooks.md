## Module Handsontable.Hooks

#### `onAfterChange`

``` purescript
onAfterChange :: forall eff dat a. Handsontable -> (DataTable dat -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterCreateCol`

``` purescript
onAfterCreateCol :: forall eff a. Handsontable -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterDeselect`

``` purescript
onAfterDeselect :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterDestroy`

``` purescript
onAfterDestroy :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterGetCellMeta`

``` purescript
onAfterGetCellMeta :: forall eff a. Handsontable -> (Int -> Int -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterGetColHeader`

``` purescript
onAfterGetColHeader :: forall eff a. Handsontable -> (Int -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterInit`

``` purescript
onAfterInit :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterLoadData`

``` purescript
onAfterLoadData :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterOnCellCornerMouseDown`

``` purescript
onAfterOnCellCornerMouseDown :: forall eff a. Handsontable -> (DOMEvent -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterOnCellMouseDown`

``` purescript
onAfterOnCellMouseDown :: forall eff a. Handsontable -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterOnCellMouseOver`

``` purescript
onAfterOnCellMouseOver :: forall eff a. Handsontable -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRemoveCol`

``` purescript
onAfterRemoveCol :: forall eff a. Handsontable -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRemoveRow`

``` purescript
onAfterRemoveRow :: forall eff a. Handsontable -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRender`

``` purescript
onAfterRender :: forall eff a. Handsontable -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRenderer`

``` purescript
onAfterRenderer :: forall eff a. Handsontable -> (HTMLElement -> Number -> Number -> String -> String -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelection`

``` purescript
onAfterSelection :: forall eff a. Handsontable -> (Int -> Int -> Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelectionByProp`

``` purescript
onAfterSelectionByProp :: forall eff a. Handsontable -> (Int -> String -> Int -> String -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelectionEnd`

``` purescript
onAfterSelectionEnd :: forall eff a. Handsontable -> (Int -> Int -> Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelectionEndByProp`

``` purescript
onAfterSelectionEndByProp :: forall eff a. Handsontable -> (Int -> String -> Int -> String -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSetCellMeta`

``` purescript
onAfterSetCellMeta :: forall eff a. Handsontable -> (Int -> Int -> String -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterUpdateSettings`

``` purescript
onAfterUpdateSettings :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterValidate`

``` purescript
onAfterValidate :: forall eff a. Handsontable -> (Boolean -> Foreign -> Int -> String -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeAutoFill`

``` purescript
onBeforeAutoFill :: forall eff a dat. Handsontable -> (Coords -> Coords -> DataTable dat -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeChange`

``` purescript
onBeforeChange :: forall eff a dat. Handsontable -> (forall h. STArray h dat -> ChangeSource -> Eff (hot :: HOT, st :: ST h | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeChangeRender`

``` purescript
onBeforeChangeRender :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeDrawBorders`

``` purescript
onBeforeDrawBorders :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeGetCellMeta`

``` purescript
onBeforeGetCellMeta :: forall eff a. Handsontable -> (Int -> Int -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeInit`

``` purescript
onBeforeInit :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeInitWalkontable`

``` purescript
onBeforeInitWalkontable :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeKeyDown`

``` purescript
onBeforeKeyDown :: forall eff a. Handsontable -> (DOMEvent -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeOnCellMouseDown`

``` purescript
onBeforeOnCellMouseDown :: forall eff a. Handsontable -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeRemoveCol`

``` purescript
onBeforeRemoveCol :: forall eff a. Handsontable -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeRemoveRow`

``` purescript
onBeforeRemoveRow :: forall eff a. Handsontable -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeRender`

``` purescript
onBeforeRender :: forall eff a. Handsontable -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeSetRangeEnd`

``` purescript
onBeforeSetRangeEnd :: forall eff a. Handsontable -> (Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeValidate`

``` purescript
onBeforeValidate :: forall eff a. Handsontable -> (Foreign -> Int -> String -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onConstruct`

``` purescript
onConstruct :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onInit`

``` purescript
onInit :: forall eff a. Handsontable -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyCol`

``` purescript
onModifyCol :: forall eff a. Handsontable -> (Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyColWidth`

``` purescript
onModifyColWidth :: forall eff a. Handsontable -> (Number -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyRow`

``` purescript
onModifyRow :: forall eff a. Handsontable -> (Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyRowHeight`

``` purescript
onModifyRowHeight :: forall eff a. Handsontable -> (Number -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```


