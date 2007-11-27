primes :: [Integer]
primes = 2 : filter (l1 . primeFactors) [3,5..]
   where
       l1 (_:[]) = True
       l1      _ = False

primeFactors :: Integer -> [Integer]
primeFactors n = factor n primes
   where
       factor _ [] = []
       factor m (p:ps) | p*p > m        = [m]
                       | m `mod` p == 0 = p : factor (m `div` p) (p:ps)
                       | otherwise      = factor m ps
                       
------------------------------------------------------------------------------
                       
primes = 2 : 3 : sieve (tail primes) [5,7..]
        where
          sieve (p:ps) x = let (h, _:t) = span (< p*p) x
                           in h ++ sieve ps (filter ((/=0).(`mod` p)) t)


primeFactors = pf primes
                where
                  pf ps@(p:ps') n
                   | p * p > n = [n]
                   | r == 0    = p : pf ps q
                   | otherwise = pf ps' n
                   where (q, r) = n `quotRem` p

isPrime = null . tail . primeFactors

primes = 2 : filter isPrime [3,5..]

-----------------------------------------------------------------------------

primes :: [Integer]
primes = 2 : filter (null . primeFactors) [3,5..]

primeFactors :: Integer-> [Integer]
primeFactors n = factor n primes
   where
       factor m (p:ps) | p*p > m        = []
                       | m `mod` p == 0 = p : factor (m `div` p) (p:ps)
                       | otherwise      = factor m ps


main = print ( sum ( takeWhile (< 1000000) primes ) )