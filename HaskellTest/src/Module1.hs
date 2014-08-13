module Module1 where

-- Import niepotrzebny (generuje warning), ale niech jakiś będzie, żeby pokazać, jak to wygląda.
import Data.List

{-
Pierwszy moduł testowy.
Nie umie zbyt wiele, ale i tak jest bardzo fajny.
-}

shout :: IO ()
shout = putStrLn "Pij piwo, będziesz wielki!" -- output

-- Teraz się pobawimy deklaracjami:

num1 :: Integer -- każda wartość dostępna publicznie powinna (choć nie musi) mieć deklarację typu
num1 = 512

lst :: [Integer] -- lista skończona
lst = [1, 2, 3]

tuple :: (Integer, String) -- krotka
tuple = (2, "piwa")

plus1 :: Integer -> Integer
plus1 n = n + 1

-- Teraz na kilka sposobów będziemy szukać liczb Fibonacciego. Da się to robić dużo ładniej i efektywniej,
-- poniższy kod traktujcie tylko jako przykład.

nfib :: Integer -> Integer
nfib 0 = 0
nfib 1 = 1
nfib n = nfib (n - 1) + nfib (n - 2)

nfib' :: Integer -> Integer
nfib' n | n < 2 = n
nfib' n = nfib' (n - 1) + nfib' (n - 2)

nfib'' :: Integer -> Integer
nfib'' n 
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = nfib'' (n - 1) + nfib'' (n - 2)
  
nfib''' :: Integer -> Integer
nfib''' n = 
  case n of
    0 -> 0
    1 -> 1
    _ -> nfib''' (n - 1) + nfib''' (n - 2)
    
-- I jeszcze coś z wartościami pomocniczymi:
distance :: Floating n => (n, n) -> (n, n) -> n
distance (x, y) (x', y') =
  let dx = x - x'
      dy = y - y' in
  sqrt(dx * dx + dy * dy)
 
 -- Można i tak:
distance' :: Floating n => (n, n) -> (n, n) -> n
distance' (x, y) (x', y') = sqrt(dx * dx + dy * dy)
  where dx = x - x'
        dy = y - y'
        
-- I z użyciem funkcji anonimowej:
distance'' :: Floating n => (n, n) -> (n, n) -> n
distance'' = 
  \ (x, y) (x', y') -> 
    let dx = x - x'
        dy = y - y' in 
    sqrt(dx * dx + dy * dy)
        
-- Funkcje dwuargumentowe mogą być użyte jako operator infiksowy:
to :: Integer -> Integer -> [Integer]
to n n' = [n .. n']

range3to13 :: [Integer]
range3to13 = 3 `to` 13

-- Z kolei operatory infiksowe to standardowe funkcje dwuargumentowe:
five :: Integer
five = (+) 2 3
   
    
-- Deklaracja typu (nazwa musi się zaczynać wielką literą!):
data Drink = Beer | Cider | Vodka Double deriving (Show, Eq, Ord)

-- Synonim typu:
type Numbers = [Integer]

range1to10 :: Numbers
range1to10 = [1 .. 10]