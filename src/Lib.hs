module Lib
  ( someFunc,
    timePlay,
    textPlay,
    jsonPlay,
  )
where

import ClassyPrelude
import Data.Time.Clock.POSIX
import Data.Time.Lens
import Data.Time.LocalTime (getZonedTime)
import Text.Regex.PCRE.Heavy
import NeatInterpolation

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
  print (modL day (+ 1) zoned)
  print (setL day 20 zoned)

textPlay :: IO ()
textPlay = do
  let reg1 = [re|^hey[a-z]*$|]
  print $ match "hello" reg1
  print $ match "heyabc" reg1
  where
    match str reg = concat [str, " ", if str =~ reg then asText "matches" else asText "doesn't match", " the specified regex"] :: Text

jsonPlay :: IO ()
jsonPlay = do
  let sample = [text|
    {
      "a": "b",
      "c": {
        "d": 5,
        "e: {
          "f": 7.0,
          "g": null
        }
      }
    }
  |]
  print sample
