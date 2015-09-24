module Handsontable.Hooks
  ( onAfterChange
  , onAfterCreateCol
  , onAfterDeselect
  , onAfterDestroy
  -- , onAfterDocumentKeyDown
  , onAfterGetCellMeta
  , onAfterGetColHeader
  -- , onAfterGetRowHeader
  , onAfterInit
  -- , onAfterIsMultipleSelectionCheck
  , onAfterLoadData
  -- , onAfterMomentumScroll
  , onAfterOnCellCornerMouseDown
  , onAfterOnCellMouseDown
  , onAfterOnCellMouseOver
  , onAfterRemoveCol
  , onAfterRemoveRow
  , onAfterRender
  , onAfterRenderer
  -- , onAfterScrollHorizontally
  -- , onAfterScrollVertically
  , onAfterSelection
  , onAfterSelectionByProp
  , onAfterSelectionEnd
  , onAfterSelectionEndByProp
  , onAfterSetCellMeta
  , onAfterUpdateSettings
  , onAfterValidate
  , onBeforeAutoFill
  -- , beforeCellAlignment
  , onBeforeChange
  , onBeforeChangeRender
  , onBeforeDrawBorders
  , onBeforeGetCellMeta
  , onBeforeInit
  , onBeforeInitWalkontable
  , onBeforeKeyDown
  , onBeforeOnCellMouseDown
  , onBeforeRemoveCol
  , onBeforeRemoveRow
  , onBeforeRender
  , onBeforeSetRangeEnd
  -- , onBeforeTouchScroll
  , onBeforeValidate
  , onConstruct
  , onInit
  , onModifyCol
  , onModifyColWidth
  , onModifyRow
  , onModifyRowHeight
  -- , onPersistentStateLoad
  -- , onPersistentStateReset
  -- , onPersistentStateSave
  ) where

import Prelude

import Control.Monad.Eff
import Control.Monad.ST

import Data.Either.Unsafe (fromRight)
import Data.Array.ST
import Data.DOM.Simple.Types (HTMLElement(), DOMEvent())

import Data.Function
import Data.Foreign

import Handsontable.Types

foreign import addHookImpl :: forall ev1 ev2 ev3 ev4 ev5 ev6 eff d a. Fn3 String (ev1 -> ev2 -> ev3 -> ev4 -> ev5 -> ev6 -> Eff (hot :: HOT | eff) a) (Handsontable d) (Eff (hot :: HOT | eff) Unit)

onAfterCellMetaReset :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterCellMetaReset self fn = runFn3 addHookImpl "afterCellMetaReset" (\_ _ _ _ _ _ -> fn) self

onAfterChange :: forall eff d a. Handsontable d -> (DataTable d -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterChange self fn = runFn3 addHookImpl "afterChange" (\changes source _ _ _ _ -> fn changes (fromRight $ readChangeSource source)) self

onAfterCreateCol :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterCreateCol self fn = runFn3 addHookImpl "afterCreateCol" (\index amount _ _ _ _ -> fn index amount) self

-- TODO: Does fire when?
onAfterDeselect :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterDeselect self fn = runFn3 addHookImpl "afterDeselect" (\_ _ _ _ _ _ -> fn) self

onAfterDestroy :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterDestroy self fn = runFn3 addHookImpl "afterDestroy" (\_ _ _ _ _ _ -> fn) self

-- afterDocumentKeyDown
-- TODO: missing in API doc

-- TODO: ADT for cellProperties?
onAfterGetCellMeta :: forall eff d a. Handsontable d -> (Int -> Int -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterGetCellMeta self fn = runFn3 addHookImpl "afterGetCellMeta" (\row col cellProps _ _ _ -> fn row col cellProps) self

onAfterGetColHeader :: forall eff d a. Handsontable d -> (Int -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterGetColHeader self fn = runFn3 addHookImpl "afterGetColHeader" (\col th _ _ _ _ -> fn col th) self

-- afterGetRowHeader
-- TODO: missing in API doc

onAfterInit :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterInit self fn = runFn3 addHookImpl "afterInit" (\_ _ _ _ _ _ -> fn) self

-- afterIsMultipleSelectionCheck
-- TODO: missing in API doc

onAfterLoadData :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterLoadData self fn = runFn3 addHookImpl "afterLoadData" (\_ _ _ _ _ _ -> fn) self

-- afterMomentumScroll
-- TODO: missing in API doc

-- TODO: migrate to purescript-dom and MouseEvent
onAfterOnCellCornerMouseDown :: forall eff d a. Handsontable d -> (DOMEvent -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterOnCellCornerMouseDown self fn = runFn3 addHookImpl "afterOnCellCornerMouseDown" (\ev _ _ _ _ _ -> fn ev) self

onAfterOnCellMouseDown :: forall eff d a. Handsontable d -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterOnCellMouseDown self fn = runFn3 addHookImpl "afterOnCellMouseDown" (\ev coords td _ _ _ -> fn ev coords td) self

onAfterOnCellMouseOver :: forall eff d a. Handsontable d -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterOnCellMouseOver self fn = runFn3 addHookImpl "afterOnCellMouseOver" (\ev coords td _ _ _ -> fn ev coords td) self

onAfterRemoveCol :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterRemoveCol self fn = runFn3 addHookImpl "afterRemoveCol" (\index amount _ _ _ _ -> fn index amount) self

onAfterRemoveRow :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterRemoveRow self fn = runFn3 addHookImpl "afterRemoveRow" (\index amount _ _ _ _ -> fn index amount) self

onAfterRender :: forall eff d a. Handsontable d -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterRender self fn = runFn3 addHookImpl "afterRender" (\isForced _ _ _ _ _ -> fn isForced) self

-- TODO: ADT for cellProperties?
onAfterRenderer :: forall eff d a. Handsontable d -> (HTMLElement -> Number -> Number -> String -> String -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterRenderer self fn = runFn3 addHookImpl "afterRenderer" (\td row col prop value cellProps -> fn td row col prop value cellProps) self

-- afterScrollHorizontally
-- TODO: missing in API doc

-- afterScrollVertically
-- TODO: missing in API doc

onAfterSelection :: forall eff d a. Handsontable d -> (Int -> Int -> Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterSelection self fn = runFn3 addHookImpl "afterSelection" (\r c r2 c2 _ _ -> fn r c r2 c2) self

onAfterSelectionByProp :: forall eff d a. Handsontable d -> (Int -> String -> Int -> String -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterSelectionByProp self fn = runFn3 addHookImpl "afterSelectionByProp" (\r p r2 p2 _ _ -> fn r p r2 p2) self

onAfterSelectionEnd :: forall eff d a. Handsontable d -> (Int -> Int -> Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterSelectionEnd self fn = runFn3 addHookImpl "afterSelectionEnd" (\r c r2 c2 _ _ -> fn r c r2 c2) self

onAfterSelectionEndByProp :: forall eff d a. Handsontable d -> (Int -> String -> Int -> String -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterSelectionEndByProp self fn = runFn3 addHookImpl "afterSelectionEndByProp" (\r p r2 p2 _ _ -> fn r p r2 p2) self

onAfterSetCellMeta :: forall eff d a. Handsontable d -> (Int -> Int -> String -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterSetCellMeta self fn = runFn3 addHookImpl "afterSetCellMeta" (\row col key value _ _ -> fn row col key value) self

onAfterUpdateSettings :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterUpdateSettings self fn = runFn3 addHookImpl "afterUpdateSettings" (\_ _ _ _ _ _ -> fn) self

onAfterValidate :: forall eff d a. Handsontable d -> (Boolean -> Foreign -> Int -> String -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterValidate self fn = runFn3 addHookImpl "afterValidate" (\isValid value row prop source _ -> fn isValid value row prop (fromRight $ readChangeSource source)) self

onBeforeAutoFill :: forall eff d a dat. Handsontable d -> (Coords -> Coords -> DataTable dat -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeAutoFill self fn = runFn3 addHookImpl "beforeAutoFill" (\start end dat _ _ _ -> fn start end dat) self

-- beforeCellAlignment
-- TODO: missing in API doc

-- TODO: Implement proper API for modifying the changes array?
onBeforeChange :: forall eff d a dat. Handsontable d -> (forall h. STArray h dat -> ChangeSource -> Eff (hot :: HOT, st :: ST h | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeChange self fn = runFn3 addHookImpl "beforeChange" (\changes source _ _ _ _ -> runST (thaw changes >>= flip fn (fromRight $ readChangeSource source))) self

onBeforeChangeRender :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeChangeRender self fn = runFn3 addHookImpl "beforeChangeRender" (\_ _ _ _ _ _ -> fn) self

onBeforeDrawBorders :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeDrawBorders self fn = runFn3 addHookImpl "beforeDrawBorders" (\_ _ _ _ _ _ -> fn) self

-- TODO: ADT for cellProperties?
onBeforeGetCellMeta :: forall eff d a. Handsontable d -> (Int -> Int -> Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeGetCellMeta self fn = runFn3 addHookImpl "beforeGetCellMeta" (\row col cellProps _ _ _ -> fn row col cellProps) self

onBeforeInit :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeInit self fn = runFn3 addHookImpl "beforeInit" (\_ _ _ _ _ _ -> fn) self

onBeforeInitWalkontable :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeInitWalkontable self fn = runFn3 addHookImpl "beforeInitWalkontable" (\_ _ _ _ _ _ -> fn) self

-- TODO: migrate to purescript-dom
onBeforeKeyDown :: forall eff d a. Handsontable d -> (DOMEvent -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeKeyDown self fn = runFn3 addHookImpl "beforeKeyDown" (\ev _ _ _ _ _ -> fn ev) self

onBeforeOnCellMouseDown :: forall eff d a. Handsontable d -> (DOMEvent -> Coords -> HTMLElement -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeOnCellMouseDown self fn = runFn3 addHookImpl "beforeOnCellMouseDown" (\ev coords td _ _ _ -> fn ev coords td) self

onBeforeRemoveCol :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeRemoveCol self fn = runFn3 addHookImpl "beforeRemoveCol" (\index amount _ _ _ _ -> fn index amount) self

onBeforeRemoveRow :: forall eff d a. Handsontable d -> (Int -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeRemoveRow self fn = runFn3 addHookImpl "beforeRemoveRow" (\index amount _ _ _ _ -> fn index amount) self

onBeforeRender :: forall eff d a. Handsontable d -> (Boolean -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeRender self fn = runFn3 addHookImpl "beforeRender" (\isForced _ _ _ _ _ -> fn isForced) self

-- TODO: Proper array instead of Foreign?
onBeforeSetRangeEnd :: forall eff d a. Handsontable d -> (Foreign -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeSetRangeEnd self fn = runFn3 addHookImpl "beforeSetRangeEnd" (\coords _ _ _ _ _ -> fn coords) self

-- beforeTouchScroll
-- TODO: missing in API doc

onBeforeValidate :: forall eff d a. Handsontable d -> (Foreign -> Int -> String -> ChangeSource -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onBeforeValidate self fn = runFn3 addHookImpl "beforeValidate" (\value row prop source _ _ -> fn value row prop (fromRight $ readChangeSource source)) self

onConstruct :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onConstruct self fn = runFn3 addHookImpl "construct" (\_ _ _ _ _ _ -> fn) self

onInit :: forall eff d a. Handsontable d -> (Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onInit self fn = runFn3 addHookImpl "init" (\_ _ _ _ _ _ -> fn) self

onModifyCol :: forall eff d a. Handsontable d -> (Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onModifyCol self fn = runFn3 addHookImpl "modifyCol" (\col _ _ _ _ _ -> fn col) self

onModifyColWidth :: forall eff d a. Handsontable d -> (Number -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onModifyColWidth self fn = runFn3 addHookImpl "modifyColWidth" (\width col _ _ _ _ -> fn width col) self

onModifyRow :: forall eff d a. Handsontable d -> (Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onModifyRow self fn = runFn3 addHookImpl "modifyRow" (\row _ _ _ _ _ -> fn row) self

onModifyRowHeight :: forall eff d a. Handsontable d -> (Number -> Int -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onModifyRowHeight self fn = runFn3 addHookImpl "modifyRowHeight" (\height row _ _ _ _ -> fn height row) self

-- persistentStateLoad
-- TODO: missing in API doc

-- persistentStateReset
-- TODO: missing in API doc

-- persistentStateSave
-- TODO: missing in API doc
