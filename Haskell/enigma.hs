-- enigma01 :: [Char] -> Int
-- enigma01 [_, 'b', c] = 0
-- enigma01 (_: 'b': c) = 1
-- enigma01 lst = 2

enigma02 :: Int -> Int -> [Int] -> Int
enigma02 x y z = length ((x : z) ++ [y])

enigma05 :: Int -> Int -> Int -> Char
enigma05 _ _ n = 'x'
enigma05 0 0 n = 'y'
enigma05 0 0 1 = 'z'

main = print $ enigma05 0 0 1

