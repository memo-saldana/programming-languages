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

-- === merge ===

merge :: (String, String) -> String
merge ([], []) = []
merge (x: tx, y: ty) = x : y : merge (tx, ty)

-- === zipx ===

zipx :: String -> String -> [(Char, Char)]
zipx _ _ = error "Not yet implemented\n"

-- === find ===
find :: String -> [(Int, String)] -> [Int]
find q lst = (map fst (filter (\(x, name) -> q == (take (length q) name)) lst))

-- === remove ===

data Record = Record Int String deriving Show

remove :: String -> [Record] -> [Record]
remove _ _ = error "Not yet implemented\n"

-- === append ===

append :: [String] -> [String] -> [String]
append mA mB = map (\(x, y) -> x ++ y) (zip mA mB)

-- === binary ===
binary :: [Int]
binary = error "Not yet implemented\n"

-- === add ===
data Number = Number Int | Fraction Int Int deriving Show

add :: Number -> Number -> Number
add (Number a) (Number b)  = (Number (a+b))
add (Fraction aN aD) (Fraction bN bD) = (Fraction ((aN * bD) + (bN * aD)) (aD * bD))
add (Number a) (Fraction bN bD) = (Fraction ((a * bD) + bN) bD)
add (Fraction bN bD) (Number a) = (Fraction ((a * bD) + bN) bD)

-- === findEvenVertices ===
data Graph  = Graph [String] deriving Show

findEvenVertices :: Graph -> String
findEvenVertices _ = error "Not yet implemented\n"

-- === Test cases ===
-- Please delete the test cases that do not apply for your submission.

main = do
    print "=== merge ==="
    print $ merge ("abc", "ABC") -- "aAbBcC"
    print $ merge ("12345", "abcde") -- "1a2b3c4d5e"
    -- print "=== zipx ==="
    -- print $ zipx "abc" "ABC" -- [('a','A'),('b','B'),('c','C')]
    -- print $ zipx "12345" "abcde" -- [('1','a'),('2','b'),('3','c'),('4','d'),('5','e')]
    print "=== find ==="
    print $ find "W" [(10, "Fernando Ortiz"), (20, "Wendy Ramirez"), (30, "Frida Spears"), (40, "Wilson Island"), (50, "Carmen Ortega"), (60, "Carlos Bond")] -- [20,40]
    print $ find "Car" [(10, "Fernando Ortiz"), (20, "Wendy Ramirez"), (30, "Frida Spears"), (40, "Wilson Island"), (50, "Carmen Ortega"), (60, "Carlos Bond")] -- [50,60]
    print $ find "B" [(10, "Fernando Ortiz"), (20, "Wendy Ramirez"), (30, "Frida Spears"), (40, "Wilson Island"), (50, "Carmen Ortega"), (60, "Carlos Bond")] -- []
    -- print "=== remove ==="
    -- print $ remove "W" [(Record 10 "Fernando Ortiz"), (Record 20 "Wendy Ramirez"), (Record 30 "Frida Spears"), (Record 40 "Wilson Island"), (Record 50 "Carmen Ortega"), (Record 60 "Carlos Bond")] -- [Record 10 "Fernando Ortiz",Record 30 "Frida Spears",Record 50 "Carmen Ortega",Record 60 "Carlos Bond"]
    -- print $ remove "Car" [(Record 10 "Fernando Ortiz"), (Record 20 "Wendy Ramirez"), (Record 30 "Frida Spears"), (Record 40 "Wilson Island"), (Record 50 "Carmen Ortega"), (Record 60 "Carlos Bond")] -- [Record 10 "Fernando Ortiz",Record 20 "Wendy Ramirez",Record 30 "Frida Spears",Record 40 "Wilson Island"]
    -- print $ remove "B" [(Record 10 "Fernando Ortiz"), (Record 20 "Wendy Ramirez"), (Record 30 "Frida Spears"), (Record 40 "Wilson Island"), (Record 50 "Carmen Ortega"), (Record 60 "Carlos Bond")] -- [Record 10 "Fernando Ortiz",Record 20 "Wendy Ramirez",Record 30 "Frida Spears",Record 40 "Wilson Island",Record 50 "Carmen Ortega",Record 60 "Carlos Bond"]
    print "=== append ==="
    print $ append ["abc", "fg", "k"] ["de", "hij", "lmno"] -- ["abcde","fghij","klmno"]
    print $ append ["x", "xxxx", "xx", "xxxxx"] ["----", "-", "---", ""] -- ["x----","xxxx-","xx---","xxxxx"]
    -- print "=== binary ==="
    -- print $ binary -- [0,1,10,11,100,101,110,111]
    print "=== add ==="
    print $ add (Number 4) (Fraction 3 4) -- Fraction 19 4
    print $ add (Number 6) (Number 8) -- Number 14
    print $ add (Fraction 5 3) (Number 6) -- Fraction 23 3
    print $ add (Fraction 1 3) (Fraction 4 7) -- Fraction 19 21    
    -- print "=== findEvenVertices ==="
    -- print $ findEvenVertices (Graph ["abc", "bcde", "cde", "de"]) -- "ac"
    