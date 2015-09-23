module Handsontable
  ( handsontable
  , handsontableNode
  , alter
  , updateSettings
  ) where

import Prelude

import Data.Maybe
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

foreign import fromJust :: forall a. a -> MaybeNull a
foreign import fromNothing :: forall a. MaybeNull a

maybeToNull :: forall a. Maybe a -> MaybeNull a
maybeToNull (Just x) = fromJust x
maybeToNull Nothing  = fromNothing

--

foreign import alterImpl :: forall eff . Fn6 String (MaybeNull Int) Int (MaybeNull String) Boolean Handsontable (Eff (hot :: HOT | eff) Handsontable)

-- | If the second argument is `Nothing`, the data will be inserted after the last column/row
alter :: forall eff a. AlterAction -> Maybe Int -> Int -> Maybe String -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Handsontable
alter action index amount source keepEmpty hot = runFn6 alterImpl (show action) (maybeToNull index) amount (maybeToNull source) keepEmpty hot

foreign import getData :: forall eff dat. Handsontable -> Eff (hot :: HOT | eff) (DataTable dat)

foreign import updateSettingsImpl :: forall eff dat r. Fn3 (Options dat r) Boolean Handsontable (Eff (hot :: HOT | eff) Handsontable)

updateSettings :: forall eff dat r. Options dat r -> Boolean -> Handsontable -> Eff (hot :: HOT | eff) Handsontable
updateSettings opts init hot = runFn3 updateSettingsImpl opts init hot
