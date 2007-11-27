choose [x] = [(x,[])]
choose (x:xs) = (x,xs) : map (\(y,ys) -> (y,x:ys)) (choose xs)

permutations [x] = [[x]]
permutations xs = do
  (x1,xs1) <- choose xs
  xs2 <- permutations xs1
  return (x1 : xs2)

answer = (permutations "0123456789") !! 999999