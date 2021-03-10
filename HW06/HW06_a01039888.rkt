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

;; === sum ===

(define (sum matrix)
	(if (null? matrix)
		0
		(if (list? (car matrix))
			(+ (sum (car matrix)) (sum (cdr matrix)))
			(+ (car matrix) (sum (cdr matrix)))
		)
	)
)

(display "=== sum ===\n")
(sum '((1 2 3) (4 5 6) (7 8 9))) ;; 45
(sum '((1 2) (30 40) (5 6) (70 80))) ;; 234
(sum '((8 9 5 6 7) (3 4 5 4 2))) ;; 53

;; === complete? ===
(define (removeOne graph)
	(if (null? graph)
		'()
		(if (null? (car graph))
			(cons '() (removeOne (cdr graph)))
			(cons (cdr (car graph)) (removeOne (cdr graph)))
		)
	)
)

(define (completeHelper graph n)
	(if (null? graph)
		#t
		(if (eq? n (length (car graph)))
			(complete? (removeOne (cdr graph)))
			#f
		)
	)
)

(define (complete? graph)
	(completeHelper graph (length graph))
)

(display "=== complete? ===\n")
(complete? '((a b c) (b a c) (c a b) (d e) (e d))) ;; #f
(complete? '((a b) (b a))) ;; #t
(complete? '( (a c) (b a) (c a))) ;; #f

;; === msort ===
(define (mergeHelper x y)
	(cond
		[(null? x) y]
		[(null? y) x]
		[(< (car x) (car y)) (cons (car x) (mergeHelper (cdr x) y))]
		[else (cons (car y) (mergeHelper x (cdr y)))]
	)
)

(define (msort lst)
	(cond
		[(or (null? lst) (null? (cdr lst))) lst]
		[(eq? (length lst) 2) (mergeHelper (list (car lst)) (cdr lst))]
		[else
			(mergeHelper 
				(msort (take lst (ceiling (/ (length lst) 2))))
				(msort (drop lst (ceiling (/ (length lst) 2))))
		  )
		]
	)
)

(display "=== msort ===\n")
(msort '()) ;; '()
(msort '(1)) ;; '(1)
(msort '(10 35 8 2.6 4.7 12)) ;; '(2.6 4.7 8 10 12 35)
(msort '(1 4 7 9 3 4 8 10)) ;; '(1 3 4 4 7 8 9 10)

;; === sold-units ===

;; This should not be done! (but it helps)
(define sales 
  '(
    (105 (10 3) (4 2) (9 3))
    (106 (6 4) (8 1) (4 6))
    (107 (9 7) (12 1) (14 1) (10 4))
    (108 (4 1))
    (109 (7 21) (10 4) (14 6) (5 3))
  )
)

(define (sumSales id sale)
	(cond
		[(null? sale) 0]
		[(eq? (caar sale) id) (+ (cadar sale) (sumSales id (cdr sale)))]
		[else (sumSales id (cdr sale))]
	)
)

(define (sold-units id sales)
	(if (null? sales) 
		0
		(+ (sumSales id (cdar sales)) (sold-units id (cdr sales)))
	)
)

(display "=== sold-units ===\n")
(sold-units 2 sales) ;; 0
(sold-units 9 sales) ;; 10
(sold-units 10 sales) ;; 11
(sold-units 14 sales) ;; 7

;; === insert ===

(define (insert x tree)
	(cond
		[(null? tree) (list x '() '())]
		[(> (car tree) x) (list (car tree) (insert x (cadr tree)) (caddr tree))]
		[else (list (car tree) (cadr tree) (insert x (caddr tree)))]
	)
)

(display "=== insert ===\n")
(insert 1 '()) ;; '(1 () ())
(insert 3 '(1 () (5 () ()))) ;; '(1 () (5 (3 () ()) ()))
(insert 0 '(1 () (5 (3 () ()) (6 () ())))) ;; '(1 (0 () ()) (5 (3 () ()) (6 () ())))

;; == set ===
(define (found? x lst)
	(if (null? lst)
		#f
		(if (eq? (car lst) x)
			#t
			(found? x (cdr lst))
		)
	)
)
(define (set lst)
  	(if (null? lst)
			'()
			(if (and (number? (car lst)) (not (found? (car lst) (cdr lst)))) ; if it is found, dont add, will add last
				(cons (car lst) (set (cdr lst)))
				(set (cdr lst))
			)
		)
		
)

(display "=== set ===\n")
(set '(1 2 3 2 4 a (1 2) 5 2 3)) ;; '(1 4 5 2 3)
(set '(a b 3 4)) ;; '(3 4)
(set '(10 (a b 3) 4 (8) c d (a b 3) d c 11)) ;; '(10 4 11)

(define (union x y)
  	(cond
			[(null? y) (set x)] ; if none remain, return x with all unique values
			[(or (found? (car y) x) (not (number? (car y)))) (union x (cdr y))]
			[else (union (cons (car y) x) (cdr y))]
		)
)

(display "=== union ===\n")
(union '(1 2 3 4) '(3 4 5 6)) ;; '(1 2 3 4 5 6)
(union '(10 2 8 4) '()) ;; '(10 2 8 4)
(union '(2 a 8 4) '(b c d)) ;; '(2 8 4)

(define (searchIntersection n lst)
	(if (null? lst)
		#f
		(if (eq? n (car lst))
			#t
			(searchIntersection n (cdr lst))
		)
	)
)

(define (intersection x y)
  	(if (null? x)
			'()
			(if (searchIntersection (car x) y)
				(cons (car x) (intersection (cdr x) y))
				(intersection (cdr x) y)
			)
		)
)

(display "=== intersection ===\n")
(intersection '(1 2 3 4) '(3 4 5 6)) ;; '(3 4)
(intersection '(10 2 8 4) '()) ;; '()
(intersection '(2 a 8 4) '(b c 8 d)) ;; '(8)
