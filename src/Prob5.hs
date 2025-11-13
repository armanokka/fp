module Prob5
  ( tailrecpic,
    recursionpic,
    modulpic,
    mappedpic,
    infinitypic
  )
where

checkI :: Int -> Int -> Bool
checkI n i = all (\j -> i `mod` j == 0) [1 .. n]

-- 1 Хвостовая рекурсия
tailrecpic :: Int -> Int
tailrecpic n = go n
  where
    go i
      | checkI n i = i
      | otherwise = go (i + n)

-- 2 Обычная рекурсия (нехвостовая)
recursionpic :: Int -> Int
recursionpic n = go n
  where
    go i
      | checkI n i = i
      | otherwise = i + go (i + n) - i

-- 3 Модульная реализация (генерация + фильтрация + свёртка)
modulpic :: Int -> Int
modulpic n = head (valid n (candidates n))
  where
    candidates m = [m, 2*m ..]
    valid m = filter (checkI m)

-- 4 Реализация с map отображением
mappedpic :: Int -> Int
mappedpic n =
  fst.head.filter snd $
    map (\x -> (x, checkI n x)) [n, 2*n ..]

-- 5 Реализация с бесконечным списком
infinitypic :: Int -> Int
infinitypic n = head [i | i <- [n, 2*n ..], checkI n i]