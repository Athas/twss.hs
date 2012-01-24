{-# LANGUAGE FlexibleContexts #-}
module Twss( TrainingData
           , readTrainingData
           , isTwss
           , isTwssProbability )
  where
import qualified Classify
import Control.Monad

threshold :: Double
threshold = 0.25

type TrainingData = [String]

readTrainingData :: FilePath -> IO TrainingData
readTrainingData = liftM lines . readFile

isTwssProbability :: Floating t => [String] -> [String] -> String -> t
isTwssProbability = Classify.getTwssProbability

isTwss :: TrainingData -> TrainingData -> String -> Bool
isTwss pos neg prompt = Classify.isTwss pos neg prompt threshold
