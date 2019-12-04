module Test.Main where

import Prelude

import Effect (Effect)
import Jest (expectToBeClose, expectToBeFalse, expectToBeTrue, expectToEqual, expectToNotEqual, test)
import Test.Example as Example

main :: Effect Unit
main = do
  test "expectToEqual" $ do
    expectToEqual { x: 1, y: 2 } { x: 1, y: 2}

  test "expectToNotEqual" $ do
    expectToNotEqual 3 2
    expectToNotEqual { x: 2, y: 1 } { x: 1, y: 2}
    expectToNotEqual (0.1 + 0.2) 0.3

  test "expectToBeClose" $ do
    expectToBeClose (0.1 + 0.2) 0.3

  test "expectToBeTrue" $ do
    expectToBeTrue (3 > 2)

  test "expectToBeFalse" $ do
    expectToBeFalse (3 < 2)

  Example.tests
