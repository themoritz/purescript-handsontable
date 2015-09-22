module Handsontable
  ( handsontable
  , handsontableNode
  , updateSettings
  ) where

import Prelude

import Data.Function
import Control.Monad.Eff

import Data.DOM.Simple.Types (HTMLElement())

import Handsontable.Options
import Handsontable.Types

foreign import handsontableImpl :: forall eff dat. Fn2 String (Options dat) (Eff (hot :: HOT | eff) Handsontable)

handsontable :: forall eff dat. String -> Options dat -> Eff (hot :: HOT | eff) Handsontable
handsontable el opts = runFn2 handsontableImpl el opts

foreign import handsontableNodeImpl :: forall eff dat. Fn2 HTMLElement (Options dat) (Eff (hot :: HOT | eff) Handsontable)

handsontableNode :: forall eff dat. HTMLElement -> Options dat -> Eff (hot :: HOT | eff) Handsontable
handsontableNode el opts = runFn2 handsontableNodeImpl el opts

--

foreign import getData :: forall eff dat. Handsontable -> Eff (hot :: HOT | eff) (DataTable dat)

foreign import updateSettingsImpl :: forall eff dat. Fn3 (Options dat) Boolean Handsontable (Eff (hot :: HOT | eff) Handsontable)

updateSettings :: forall eff dat. Options dat -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Handsontable
updateSettings opts init hot = runFn3 updateSettingsImpl opts init hot
