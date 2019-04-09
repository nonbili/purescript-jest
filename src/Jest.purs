module Jest
  ( describe
  , describeOnly
  , describeSkip
  , test
  , testOnly
  , testSkip
  , expectToEqual
  , expectToNotEqual
  , expectToBeClose
  , expectToBeTrue
  , expectToBeFalse
  ) where

import Prelude

import Control.Promise (Promise, fromAff)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)

foreign import describe_ :: EffectFn2 String (Effect Unit) Unit
describe :: String -> Effect Unit -> Effect Unit
describe = runEffectFn2 describe_

foreign import describeOnly_ :: EffectFn2 String (Effect Unit) Unit
describeOnly :: String -> Effect Unit -> Effect Unit
describeOnly = runEffectFn2 describeOnly_

foreign import describeSkip_ :: EffectFn2 String (Effect Unit) Unit
describeSkip :: String -> Effect Unit -> Effect Unit
describeSkip = runEffectFn2 describeSkip_

foreign import test_ :: EffectFn2 String (Effect (Promise Unit)) Unit
test :: String -> Aff Unit -> Effect Unit
test name action = runEffectFn2 test_ name (fromAff action)

foreign import testOnly_ :: EffectFn2 String (Effect (Promise Unit)) Unit
testOnly :: String -> Aff Unit -> Effect Unit
testOnly name action = runEffectFn2 testOnly_ name (fromAff action)

foreign import testSkip_ :: EffectFn2 String (Effect (Promise Unit)) Unit
testSkip :: String -> Aff Unit -> Effect Unit
testSkip name action = runEffectFn2 testSkip_ name (fromAff action)

foreign import expectToEqual_ :: forall a. Eq a => EffectFn2 a a Unit
expectToEqual :: forall a. Eq a => a -> a -> Aff Unit
expectToEqual = (compose liftEffect) <<< runEffectFn2 expectToEqual_

foreign import expectToNotEqual_ :: forall a. Eq a => EffectFn2 a a Unit
expectToNotEqual :: forall a. Eq a => a -> a -> Aff Unit
expectToNotEqual = (compose liftEffect) <<< runEffectFn2 expectToNotEqual_

-- | https://jestjs.io/docs/en/expect#tobeclosetonumber-numdigits
foreign import expectToBeClose_ :: EffectFn2 Number Number Unit
expectToBeClose :: Number -> Number -> Aff Unit
expectToBeClose = (compose liftEffect) <<< runEffectFn2 expectToBeClose_

foreign import expectToBeTrue_ :: EffectFn1 Boolean Unit
expectToBeTrue :: Boolean -> Aff Unit
expectToBeTrue = liftEffect <<< runEffectFn1 expectToBeTrue_

foreign import expectToBeFalse_ :: EffectFn1 Boolean Unit
expectToBeFalse :: Boolean -> Aff Unit
expectToBeFalse = liftEffect <<< runEffectFn1 expectToBeFalse_
