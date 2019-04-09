module Example
  ( sum
  , mkPoint
  ) where

import Prelude

type Point =
  { x :: Int
  , y :: Int
  }

sum :: Int -> Int -> Int
sum = (+)

mkPoint :: Int -> Int -> Point
mkPoint = { x: _, y: _ }
