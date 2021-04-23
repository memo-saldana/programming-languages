-- ====================
-- Complete the following functions and submit your file to Canvas.
-- ====================
-- Do not change the names of the functions. 
-- Do not change the number of arguments in the functions.
-- If your file cannot be loaded by the Haskell compiler, your submission may be cancelled. 
-- Then, submit only code that works.
-- ====================
-- Grading instructions:
-- There is a series of test cases for each function. In order to state that your function
-- "works as described", your output must be similar to the expected one in each case.

-- === distance ===
distance :: (Double, Double) -> (Double, Double) -> Double
distance p1 p2  = sqrt((fst p1 - fst p2) ^2 + (snd p1 - snd p2) ^ 2)

-- === shift ===

shift :: [t] -> Int -> [t]
shift lst n 
    | n == 0 = lst
    | n > 0 = shift ((last lst) : (init lst)) (n-1)
    | n < 0 = shift ((tail lst) ++ [head lst]) (n+1)
-- === myFilter ===

-- Please note that this function takes two arguments.
-- The first one is a function of type (t -> Bool)
-- The second one is a list of a generic type, t.
myFilter :: (t -> Bool) -> [t] -> [t]
myFilter _ [] = []
myFilter func (h:t) = if (func h)
    then h : (myFilter func t)
    else  (myFilter func t)
-- === crossover ===

crossover :: [Char] -> [Char] -> Int -> ([Char], [Char])
crossover [] [] _ = ([], [])
crossover (x: tx) (y: ty) z = if z == 1
    then ((x: ty), (y: tx))
    else (
        (x: (fst (crossover tx ty (z-1)))),
        (y: (snd (crossover tx ty (z-1))))
    )

-- === xSort ===

xSort :: [(String, Int, Int)] -> [(String, Int, Int)]
xSort [] = []
xSort ((t1Name, t1Pts, t1Goals) : t) =
    xSort (filter (\(t, pts, goals) -> if pts == t1Pts then goals >= t1Goals else pts >= t1Pts) t)
    ++ [(t1Name, t1Pts, t1Goals)] 
    ++ xSort (filter (\(t, pts, goals) -> if pts == t1Pts then goals <= t1Goals else pts <= t1Pts) t)


-- === treeSum ===

data Tree = Tree Int Tree Tree | E deriving Show

treeSum :: Tree -> Int
treeSum (E) = 0
treeSum (Tree n left right) = n + (treeSum left) + (treeSum right)
-- === Test cases ===

main = do
    print "=== distance ==="
    print $ distance (10, 20) (5, 15) -- 7.0710678118654755
    print "=== shift ==="
    print $ shift [3, 5, 1, 4, 2] 3 -- [1,4,2,3,5]
    print $ shift [3, 5, 1, 4, 2] (-3) -- [4,2,3,5,1]
    print $ shift "helloworld" 75 -- "worldhello"
    print "=== myFilter ==="
    print $ myFilter (> 3) [1, 2, 3, 4, 5, 6, 7] -- [4,5,6,7]
    print $ myFilter (\x -> x * 2 < 5) [1, 2, 3, 4, 5, 6, 7] -- [1,2]
    print "=== crossover ==="
    print $ crossover "aaaaa" "bbbbb" 3 -- ("aaabb","bbbaa")
    print $ crossover "aaaaa" "bbbbb" 1 -- ("abbbb","baaaa")
    print $ crossover "aaaaa" "bbbbb" 4 -- ("aaaab","bbbba")
    print "=== xSort ==="
    print $ xSort [("Pumas", 10, 3), ("America", 10, 5), ("Chivas", 11, 8), ("Cruz Azul", 11, 2), ("Tigres", 9, 4), ("Rayados", 9, 6)] -- [("Chivas",11,8),("Cruz Azul",11,2),("America",10,5),("Pumas",10,3),("Rayados",9,6),("Tigres",9,4)]
    print "=== treeSum ==="
    print $ treeSum (Tree 8 (Tree 5 (Tree 2 E E) (Tree 7 E E)) (Tree 9 E E))