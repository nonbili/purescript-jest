module Test.Main where

import Prelude

import Effect (Effect)
import Example (sum)
import Jest (expectToBe, test)

main :: Effect Unit
main =
  test "sum" $ do
    expectToBe (sum 1 2) 3
    expectToBe (sum 22 11) 33
