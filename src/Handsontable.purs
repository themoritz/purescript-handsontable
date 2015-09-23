module Handsontable
  ( handsontable
  , handsontableNode
  , updateSettings
  ) where

import Prelude

import Data.Function
import Control.Monad.Eff

import Data.DOM.Simple.Types (HTMLElement())

import Handsontable.Types

foreign import handsontableImpl :: forall eff dat r. Fn2 String (Options dat r) (Eff (hot :: HOT | eff) Handsontable)

handsontable :: forall eff dat r. String -> Options dat r -> Eff (hot :: HOT | eff) Handsontable
handsontable el opts = runFn2 handsontableImpl el opts

foreign import handsontableNodeImpl :: forall eff dat r. Fn2 HTMLElement (Options dat r) (Eff (hot :: HOT | eff) Handsontable)

handsontableNode :: forall eff dat r. HTMLElement -> Options dat r -> Eff (hot :: HOT | eff) Handsontable
handsontableNode el opts = runFn2 handsontableNodeImpl el opts

--

foreign import getData :: forall eff dat. Handsontable -> Eff (hot :: HOT | eff) (DataTable dat)

foreign import updateSettingsImpl :: forall eff dat r. Fn3 (Options dat r) Boolean Handsontable (Eff (hot :: HOT | eff) Handsontable)

updateSettings :: forall eff dat r. Options dat r -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Handsontable
updateSettings opts init hot = runFn3 updateSettingsImpl opts init hot
