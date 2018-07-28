module Jest
  ( test
  , expectToBe
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)

foreign import test_ :: EffectFn2 String (Effect Unit) Unit
test :: String -> Effect Unit -> Effect Unit
test = runEffectFn2 test_

foreign import expectToBe_ :: forall a. Eq a => EffectFn2 a a Unit
expectToBe :: forall a. Eq a => a -> a -> Effect Unit
expectToBe = runEffectFn2 expectToBe_
