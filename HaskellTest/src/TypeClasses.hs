module TypeClasses where

data MyNum = Zero | One deriving (Show, Eq, Ord)

instance Num MyNum where
  abs = id
  
  fromInteger 0 = Zero
  fromInteger _ = One
  
  Zero + n = n
  One + n = other n
  
  n - Zero = n
  n - One = other n
  
  One * One = One
  _ * _ = Zero
  
  signum = id
  
other :: MyNum -> MyNum
other Zero = One
other One = Zero