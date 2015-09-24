## Module Handsontable.Hooks

#### `onAfterChange`

``` purescript
onAfterChange :: forall eff d a. Handsontable d -> (DataTable d -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterCreateCol`

``` purescript
onAfterCreateCol :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterDeselect`

``` purescript
onAfterDeselect :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterDestroy`

``` purescript
onAfterDestroy :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterGetCellMeta`

``` purescript
onAfterGetCellMeta :: forall eff d a. Handsontable d -> (Int -> Int -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterGetColHeader`

``` purescript
onAfterGetColHeader :: forall eff d a. Handsontable d -> (Int -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterInit`

``` purescript
onAfterInit :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterLoadData`

``` purescript
onAfterLoadData :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterOnCellCornerMouseDown`

``` purescript
onAfterOnCellCornerMouseDown :: forall eff d a. Handsontable d -> (DOMEvent -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterOnCellMouseDown`

``` purescript
onAfterOnCellMouseDown :: forall eff d a. Handsontable d -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterOnCellMouseOver`

``` purescript
onAfterOnCellMouseOver :: forall eff d a. Handsontable d -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRemoveCol`

``` purescript
onAfterRemoveCol :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRemoveRow`

``` purescript
onAfterRemoveRow :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRender`

``` purescript
onAfterRender :: forall eff d a. Handsontable d -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterRenderer`

``` purescript
onAfterRenderer :: forall eff d a. Handsontable d -> (HTMLElement -> Number -> Number -> String -> String -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelection`

``` purescript
onAfterSelection :: forall eff d a. Handsontable d -> (Int -> Int -> Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelectionByProp`

``` purescript
onAfterSelectionByProp :: forall eff d a. Handsontable d -> (Int -> String -> Int -> String -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelectionEnd`

``` purescript
onAfterSelectionEnd :: forall eff d a. Handsontable d -> (Int -> Int -> Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSelectionEndByProp`

``` purescript
onAfterSelectionEndByProp :: forall eff d a. Handsontable d -> (Int -> String -> Int -> String -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterSetCellMeta`

``` purescript
onAfterSetCellMeta :: forall eff d a. Handsontable d -> (Int -> Int -> String -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterUpdateSettings`

``` purescript
onAfterUpdateSettings :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onAfterValidate`

``` purescript
onAfterValidate :: forall eff d a. Handsontable d -> (Boolean -> Foreign -> Int -> String -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeAutoFill`

``` purescript
onBeforeAutoFill :: forall eff d a dat. Handsontable d -> (Coords -> Coords -> DataTable dat -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeChange`

``` purescript
onBeforeChange :: forall eff d a dat. Handsontable d -> (forall h. STArray h dat -> ChangeSource -> Eff (hot :: HOT, st :: ST h | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeChangeRender`

``` purescript
onBeforeChangeRender :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeDrawBorders`

``` purescript
onBeforeDrawBorders :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeGetCellMeta`

``` purescript
onBeforeGetCellMeta :: forall eff d a. Handsontable d -> (Int -> Int -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeInit`

``` purescript
onBeforeInit :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeInitWalkontable`

``` purescript
onBeforeInitWalkontable :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeKeyDown`

``` purescript
onBeforeKeyDown :: forall eff d a. Handsontable d -> (DOMEvent -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeOnCellMouseDown`

``` purescript
onBeforeOnCellMouseDown :: forall eff d a. Handsontable d -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeRemoveCol`

``` purescript
onBeforeRemoveCol :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeRemoveRow`

``` purescript
onBeforeRemoveRow :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeRender`

``` purescript
onBeforeRender :: forall eff d a. Handsontable d -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeSetRangeEnd`

``` purescript
onBeforeSetRangeEnd :: forall eff d a. Handsontable d -> (Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onBeforeValidate`

``` purescript
onBeforeValidate :: forall eff d a. Handsontable d -> (Foreign -> Int -> String -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onConstruct`

``` purescript
onConstruct :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onInit`

``` purescript
onInit :: forall eff d a. Handsontable d -> Eff (hot :: HOT | eff) a -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyCol`

``` purescript
onModifyCol :: forall eff d a. Handsontable d -> (Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyColWidth`

``` purescript
onModifyColWidth :: forall eff d a. Handsontable d -> (Number -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyRow`

``` purescript
onModifyRow :: forall eff d a. Handsontable d -> (Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```

#### `onModifyRowHeight`

``` purescript
onModifyRowHeight :: forall eff d a. Handsontable d -> (Number -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
```


