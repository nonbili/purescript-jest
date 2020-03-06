module Test.Example where

import Prelude

import Data.Foldable (for_)
import Effect (Effect)
import Example (sum, mkPoint, asyncSum)
import Jest (describe, expectToEqual, test)

tests :: Effect Unit
tests = do
  describe "test Example module" $ do
    for_ [1,2] \_ ->
      test "sum" $ do
        expectToEqual (sum 1 2) 3
        expectToEqual (sum 22 11) 33

  describe "test Example module2" $ do
    test "mkPoint" $ do
      expectToEqual (mkPoint 1 2) { x: 1, y: 2 }

    test "asyncSum" $ do
      v <- asyncSum 1 2
      expectToEqual v 3
