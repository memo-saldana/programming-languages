#lang racket

;; ====================
;; Complete the following functions and submit your file to Canvas.
;; ====================
;; Do not change the names of the functions. 
;; Do not change the number of arguments in the functions.
;; If your file cannot be loaded by the Racket interpreted, your submission may be cancelled. Then, submit only code that works.
;; ====================
;; Grading instructions:
;; There is a series of test cases for each function. In order to state that your function "works as described", your output must be similar to the expected one in each case.

;; === multiple7 ===

(define (multiple7 lst)
  (filter (lambda (n) (equal? (remainder n 7) 0)) lst)
)

(display "=== multiple7 ===\n")
(multiple7 '(3 7 49 70 143 512)) ;; '(7 49 70)
(multiple7 '(21 28 35 56 60 82 91 110)) ;; '(21 28 35 56 91)

;; === large-countries ===

(define countries '(("Argentina" 45195774) ("Brazil" 212559417) ("China" 1439323776) ("Colombia" 50882891) ("France" 65273511) ("Mexico" 128932753) ("Spain" 46754778) ("United Kingdom" 67886011) ("United States" 331002651)))

(define (large-countries lst threshold)
	(map 
    car 
    (filter 
      (lambda (n) (> (cadr n) threshold))
      lst
    )
  )
)

(display "=== large-countries ===\n")
(large-countries countries 50000000)
(large-countries countries 100000000)
(large-countries countries 300000000)

;; === group ===

(define (group lstA lstB)
	(map 
    list lstA lstB
  )
)

(display "=== group ===\n")
(group '(1 6) '(x 4)) ;; '((1 x) (6 4))
(group '(4 -3 a 10) '(7 b z (x y z))) ;; '((4 7) (-3 b) (a z) (10 (x y z)))
(group '(2 8 17 5) '(4 3 6 6)) ;; '((2 4) (8 3) (17 6) (5 6))

;; === combine ===

(define (combine lstA lstB)
  (apply append (group lstA lstB))
)

(display "=== combine ===\n")
(combine '(1 6) '(x 4)) ;; '(1 x 6 4)
(combine '(4 -3 a 10) '(7 b z (x y z))) ;; '(4 7 -3 b a z 10 (x y z))
(combine '(2 8 17 5) '(4 3 6 6)) ;; '(2 4 8 3 7 6 5 6)

(define (sumeven lst)
  (apply + (filter even? lst))
)

(display "=== sumeven ===\n")
(sumeven '(1 2 3 4 5 6 7 8 9 10)) ;; 30
(sumeven '(100 200 33 47 50 90)) ;; 440
(sumeven '(2 4 0 9 7)) ;; 6

;; === matrixsum ===

(define (matrixsum mA mB)
  (map (lambda (x y) (map + x y)) mA mB)
)

(display "=== matrixsum ===\n")
(matrixsum '((1 2 3) (4 5 6)) '((10 20 30) (40 50 60))) ;; '((11 22 33) (44 55 66))
(matrixsum '((1 2) (3 4) (5 6)) '((10 20) (30 40) (50 60))) ;; '((11 22) (33 44) (55 66))