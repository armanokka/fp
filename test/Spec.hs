import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Prob5 as R
import qualified Prob25 as K

main :: IO ()
main = do
  TIO.putStrLn (T.pack "1 tests")
  assertEquals (R.tailrecpic 20, 232792560) (T.pack "Хвостовая рекурсия")
  assertEquals (R.recursionpic 20, 232792560) (T.pack "Рекурсия")
  assertEquals (R.modulpic 20, 232792560) (T.pack "Модульная реализация")
  assertEquals (R.mappedpic 20, 232792560) (T.pack "Map-реализация")
  assertEquals (R.infinitypic 20, 232792560) (T.pack "Бесконечный список")
  TIO.putStrLn (T.pack "end\n")

  TIO.putStrLn (T.pack "2 tests\n")
  assertEquals (K.tailrecpic, 4782) (T.pack "Хвостовая рекурсия")
  assertEquals (K.recursionpic, 4782) (T.pack "Рекурсия")
  assertEquals (K.modulpic, 4782) (T.pack "Модульная реализация")
  assertEquals (K.mappedpic, 4782) (T.pack "Map-реализация")
  assertEquals (K.infinitypic, 4782) (T.pack "Бесконечный список")
  assertEquals (K.zipwithpic, 4782) (T.pack "ZipWith с коррекцией индексации")
  TIO.putStrLn (T.pack "end\n")

assertEquals :: (Eq a, Show a) => (a, a) -> T.Text -> IO ()
assertEquals (a, b) testDesc =
  TIO.putStrLn $
    (if a == b then T.pack "Passed: " else T.pack "Failed: ")
      <> testDesc
      <> (if a == b then T.empty else T.pack (" (получено " <> show a <> ", ожидалось " <> show b <> ")"))