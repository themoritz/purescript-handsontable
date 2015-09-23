module Handsontable.Hooks
  ( onAfterChange
  ) where

import Prelude

import Control.Monad.Eff

import Data.Function

import Handsontable.Types

foreign import addHookImpl :: forall ev1 ev2 ev3 ev4 ev5 ev6 eff a. Fn3 String (ev1 -> ev2 -> ev3 -> ev4 -> ev5 -> ev6 -> Eff (hot :: HOT | eff) a) Handsontable (Eff (hot :: HOT | eff) Unit)

-- TODO: ADT instead of string?
onAfterChange :: forall eff dat a. Handsontable -> (DataTable dat -> String -> Eff (hot :: HOT | eff) a) -> Eff (hot :: HOT | eff) Unit
onAfterChange self fn = runFn3 addHookImpl "afterChange" (\changes source _ _ _ _ -> fn changes source) self
