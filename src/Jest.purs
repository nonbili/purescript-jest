module Jest
  ( test
  , expectToEqual
  , expectToNotEqual
  , expectToBeClose
  , expectToBeTrue
  , expectToBeFalse
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)

foreign import test_ :: EffectFn2 String (Effect Unit) Unit
test :: String -> Effect Unit -> Effect Unit
test = runEffectFn2 test_

foreign import expectToEqual_ :: forall a. Eq a => EffectFn2 a a Unit
expectToEqual :: forall a. Eq a => a -> a -> Effect Unit
expectToEqual = runEffectFn2 expectToEqual_

foreign import expectToNotEqual_ :: forall a. Eq a => EffectFn2 a a Unit
expectToNotEqual :: forall a. Eq a => a -> a -> Effect Unit
expectToNotEqual = runEffectFn2 expectToNotEqual_

-- | https://jestjs.io/docs/en/expect#tobeclosetonumber-numdigits
expectToBeClose :: Number -> Number -> Effect Unit
expectToBeClose = runEffectFn2 expectToBeClose_
foreign import expectToBeClose_ :: EffectFn2 Number Number Unit

foreign import expectToBeTrue_ :: EffectFn1 Boolean Unit
expectToBeTrue :: Boolean -> Effect Unit
expectToBeTrue = runEffectFn1 expectToBeTrue_

foreign import expectToBeFalse_ :: EffectFn1 Boolean Unit
expectToBeFalse :: Boolean -> Effect Unit
expectToBeFalse = runEffectFn1 expectToBeFalse_
