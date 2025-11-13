module Prob25
  ( tailrecpic,
    recursionpic,
    modulpic,
    mappedpic,
    infinitypic,
    zipwithpic
  )
where

import Data.List (zipWith, takeWhile)

target :: Integer
target = 10 ^ 999  

-- 1 Хвостовая рекурсия
tailrecpic :: Int
tailrecpic = go 1 1 2
  where
    go a b i
      | b >= target = i
      | otherwise = go b (a + b) (i + 1)

-- 2 Обычная рекурсия (нехвостовая)
recursionpic :: Int
recursionpic = findIndexRec 1 1 2
  where
    findIndexRec a b i
      | b >= target = i
      | otherwise = findIndexRec b (a + b) (i + 1)

-- 3 Модульная реализация (генерация + фильтрация + свёртка)
modulpic :: Int
modulpic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

-- 4 Реализация с map отображением
mappedpic :: Int
mappedpic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = map fst $ iterate (\(a, b) -> (b, a + b)) (1, 1)

-- 5 Реализация с бесконечным списком
infinitypic :: Int
infinitypic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = fibgen 1 1
    fibgen a b = a : fibgen b (a + b)

zipwithpic :: Int
zipwithpic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)