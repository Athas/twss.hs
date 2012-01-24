module Main (main) where

import Twss
import System.Environment

main :: IO ()
main = do args <- getArgs
          case args of
            [posf, negf] -> do
                      pos <- readTrainingData posf
                      neg <- readTrainingData negf
                      interact $ unlines . filter (isTwss pos neg) . lines
            _ -> error "usage: <positives-file> <negatives-file>"
