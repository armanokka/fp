# Лабораторная работа 1. Проект Эйлера
Вариант: 5, 25 


ФИО: Торениязов Арман Ажинияз Улы 

Цель: освоить базовые приёмы и абстракции функционального программирования: функции, поток управления и поток данных, сопоставление с образцом, рекурсия, свёртка, отображение, работа с функциями как с данными, списки.

## Условия задачек

### Задача 5

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder. What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

### Задача 25
The Fibonacci sequence is defined by the recurrence relation:

$F_n = F_{n−1} + F_{n−2}$, where $F_1 = 1$ and $F_2 = 1.$ 

Hence the first 12 terms will be:
```math
F_1 = 1, \\
F_2 = 1, \\
F_3 = 2, \\
F_4 = 3, \\
F_5 = 5, \\
F_6 = 8, \\
F_7 = 13, \\
F_8 = 21, \\
F_9 = 34, \\
F_{10} = 55, \\
F_{11} = 89, \\
F_{12} = 144
```

The 12th term, $F_{12}$, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?

## Реализация
### Задачка 5
- Служебная функция `checkI`
```
checkI :: Int -> Int -> Bool
checkI n i = all (\j -> i `mod` j == 0) [1 .. n]
```
- Хвостовая рекурсия:
```
tailrecpic :: Int -> Int
tailrecpic n = go n
  where
    go i
      | checkI n i = i
      | otherwise = go (i + n)
``` 
- Рекурсия (добавлены + и - i, для наглядного примера разницы между хвостовой и обычной)
```
recursionpic :: Int -> Int
recursionpic n = go n
  where
    go i
      | checkI n i = i
      | otherwise = i + go (i + n) - i
```
- Реализация с явным разделением на генерацию, фильтрацию и свертку:
```
modulpic :: Int -> Int
modulpic n = head (valid n (candidates n))
  where
    candidates m = [m, 2*m ..]
    valid m xs = filter (checkI m) xs
```
- Реализация при помощи map:
```
mappedpic :: Int -> Int
mappedpic n =
  fst.head.filter snd $
    map (\x -> (x, checkI n x)) [n, 2*n ..]
```
- Реализация с использованием бесконечных списков:
```
infinitypic :: Int -> Int
infinitypic n = head [i | i <- [n, 2*n ..], checkI n i]
```
- Кусок реализации на питоне для сравнения:
```
for i in range(1,1000):
    fraction = 1/Decimal(i)
    pattern = re.search(r"^[0-9]\.[0-9]*([0-9]{7,}?)(\1+)[0-9]*?$", str(fraction))
    
    length = displaymatch(pattern)

    if length > maxlen:
        maxlen = length
        d = i
```
### Задачка 25
- Служебные функции `target`
```
target :: Integer
target = 10 ^ 999 

```
- Хвостовая рекурсия:
```
tailrecpic :: Int
tailrecpic = go 1 1 2
  where
    go a b i
      | b >= target = i
      | otherwise = go b (a + b) (i + 1)
```
- Рекурсия
```
recursionpic :: Int
recursionpic = findIndexRec 1 1 2
  where
    findIndexRec a b i
      | b >= target = i
      | otherwise = findIndexRec b (a + b) (i + 1)
```
- Реализация с явным разделением на генерацию, фильтрацию и свертку:
```
modulpic :: Int
modulpic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
```
- Реализация при помощи map:
```
mappedpic :: Int
mappedpic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = map fst $ iterate (\(a, b) -> (b, a + b)) (1, 1)
```
- Реализация с использованием бесконечных списков:
```
infinitypic :: Int
infinitypic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = fibgen 1 1
    fibgen a b = a : fibgen b (a + b)

zipwithpic :: Int
zipwithpic = (+1) $ length $ takeWhile (< target) fibs
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
```
- Кусок реализации на питоне для сравнения:
```
fibonnaci = [1,1]
largedigits = []
i = 2
while i < 10000:
    new = fibonnaci[i-1] + fibonnaci[i-2]
    if len(str(new)) == 1000:
        break
    else:
        fibonnaci.append(new)
    i+=1
print i
```
# Вывод
В ходе выполнения работы были исследованы разные подходы к решению двух задач из `Project Euler` 
- задача номер 5 (поиск наименьшего числа, кратного числам 1..N) \ 
- задача номер 25 (определение индекса первого числа Фибоначчи, содержащего 1000 цифр) \
Для каждой задачи были реализованы несколько вариантов решения, отражающие ключевые техники функционального программирования, работа продемонстрировала возможности Haskell как языка, в котором можно выразить одну задачу множеством способов, подчеркивая важные концепции функционального программирования: чистоту, композицию, рекурсию и ленивые вычисления.
