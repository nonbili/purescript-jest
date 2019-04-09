module Example
  ( sum
  , mkPoint
  , asyncSum
  ) where

import Prelude

import Control.Promise (Promise, toAffE)
import Effect.Aff (Aff)
import Effect.Uncurried (EffectFn2, runEffectFn2)

type Point =
  { x :: Int
  , y :: Int
  }

sum :: Int -> Int -> Int
sum = (+)

mkPoint :: Int -> Int -> Point
mkPoint = { x: _, y: _ }

foreign import asyncSum_ :: EffectFn2 Int Int (Promise Int)
asyncSum :: Int -> Int -> Aff Int
asyncSum a b = toAffE (runEffectFn2 asyncSum_ a b)
