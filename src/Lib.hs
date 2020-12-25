module Lib
    ( someFunc
    ) where

import ClassyPrelude
import Data.Time.Clock.POSIX

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
  let t1 = posixSecondsToUTCTime 60.5