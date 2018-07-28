module Jest
  ( test
  , expectToEqual
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)

foreign import test_ :: EffectFn2 String (Effect Unit) Unit
test :: String -> Effect Unit -> Effect Unit
test = runEffectFn2 test_

foreign import expectToEqual_ :: forall a. Eq a => EffectFn2 a a Unit
expectToEqual :: forall a. Eq a => a -> a -> Effect Unit
expectToEqual = runEffectFn2 expectToEqual_
