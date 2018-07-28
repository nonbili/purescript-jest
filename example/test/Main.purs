module Test.Main where

import Prelude

import Effect (Effect)
import Example (sum, mkPoint)
import Jest (expectToBe, expectToEqual, test)

main :: Effect Unit
main = do
  test "sum" $ do
    expectToBe (sum 1 2) 3
    expectToBe (sum 22 11) 33

  test "mkPoint" $ do
    expectToEqual (mkPoint 1 2) { x: 1, y: 2 }
    expectToEqual (mkPoint 22 11) { x: 22, y: 11 }
