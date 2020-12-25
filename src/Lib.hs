module Lib
  ( someFunc,
    timePlay,
  )
where

import ClassyPrelude
import Data.Time.Clock.POSIX
import Data.Time.Lens
import Data.Time.LocalTime (getZonedTime)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

{-
String - the vanilla version
Text - Unicode string
LText - Lazy Text
ByteString -
LByteString - Lazy version
-}

timePlay :: IO ()
timePlay = do
  now <- getCurrentTime
  zoned <- getZonedTime
  -- print (getL timeZone zoned)
  print (getL timeZone zoned, getL year zoned)
  print (modL day (+1) zoned)
  print (setL day 20 zoned)
