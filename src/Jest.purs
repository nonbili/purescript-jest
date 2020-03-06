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

foreign import describe :: String -> Effect Unit -> Effect Unit

foreign import describeOnly :: String -> Effect Unit -> Effect Unit

foreign import describeSkip :: String -> Effect Unit -> Effect Unit

foreign import test_ :: String -> Effect (Promise Unit) -> Effect Unit
test :: String -> Aff Unit -> Effect Unit
test name action = test_ name (fromAff action)

foreign import testOnly_ :: String ->Effect (Promise Unit) -> Effect Unit
testOnly :: String -> Aff Unit -> Effect Unit
testOnly name action = testOnly_ name (fromAff action)

foreign import testSkip_ :: String -> Effect (Promise Unit) -> Effect Unit
testSkip :: String -> Aff Unit -> Effect Unit
testSkip name action = testSkip_ name (fromAff action)

foreign import expectToEqual_ :: forall a. a -> a -> Effect Unit
expectToEqual :: forall a. Eq a => a -> a -> Aff Unit
expectToEqual a b = liftEffect $ expectToEqual_ a b

foreign import expectToNotEqual_ :: forall a. a -> a -> Effect Unit
expectToNotEqual :: forall a. Eq a => a -> a -> Aff Unit
expectToNotEqual a b = liftEffect $ expectToNotEqual_ a b

-- | https://jestjs.io/docs/en/expect#tobeclosetonumber-numdigits
foreign import expectToBeClose_ :: Number -> Number -> Effect Unit
expectToBeClose :: Number -> Number -> Aff Unit
expectToBeClose a b = liftEffect$ expectToBeClose_ a b

foreign import expectToBeTrue_ :: Boolean -> Effect Unit
expectToBeTrue :: Boolean -> Aff Unit
expectToBeTrue = liftEffect <<< expectToBeTrue_

foreign import expectToBeFalse_ :: Boolean -> Effect Unit
expectToBeFalse :: Boolean -> Aff Unit
expectToBeFalse = liftEffect <<< expectToBeFalse_
