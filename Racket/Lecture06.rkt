#lang racket

;; ====================
;; Codes for Lecture 06
;; Data structures in Racket
;; ====================

;; === Insertion sort ===

(define (insert x lst)
	(cond 
		((null? lst) (list x))
		((< x (car lst)) (cons x lst))		
		(else (cons (car lst) (insert x (cdr lst))))
	)
)

(define (isort lst)
	(if (null? lst)
		null
		(insert (car lst) (isort (cdr lst)))
	)
)

(display "=== Insertion sort ===\n")
(isort '(40 23 19 3 12 6)) ;; '(3 6 12 19 23 40)

;; === Sum of matrices ===

(define (rowSum rA rB)
	(if (null? rA)
		'()
		(cons (+ (car rA) (car rB)) (rowSum (cdr rA) (cdr rB)))
	)
)

(define (matrixSum matrixA matrixB)
	(if (null? matrixA)
		'()
		(cons (rowSum (car matrixA) (car matrixB)) (matrixSum (cdr matrixA) (cdr matrixB)))
	)
)

(display "=== Sum of matrices ===\n")
(matrixSum '((1 2 3) (4 5 6) (7 8 9)) '((10 20 30) (40 50 60) (70 80 90))) ;;'((11 22 33) (44 55 66) (77 88 99))

;; === Extracting information from tables ===

(define (getIDs table threshold)
	(if (null? table)
		null
		(if (> (cadr (list-ref (car table) 3)) threshold)
			(cons (caar table) (getIDs (cdr table) threshold))
			(getIDs (cdr table) threshold)
		)
	)
)

(display "=== Extracting information from tables ===\n")
(getIDs
'(
	((id 796623) (name Rodrigo) (last-name Orozco) (grade 89)) 
	((id 101224) (name Juan) (last-name Carrasco) (grade 91)) 
	((id 982112) (name Erika) (last-name Gallardo) (grade 97))
	((id 662544) (name Karla) (last-name Durante) (grade 90))
	((id 727331) (name Damian) (last-name Espinoza) (grade 85))
) 90)

;; === Stacks ===

(define (push x stack)
	(cons x stack)
)

(define (pop stack)
	(cdr stack)
)

(define (peek stack)
	(car stack)
)

;; === Queues ===

(define (add x queue)
	(append queue (list x))
)

(define (remove queue)
	(cdr queue)
)

(define (first queue)
	(car queue)
)

;; === Binary search trees ===

'(8
	(5 
		(2 () ())
		(7 () ())
	)
	(9 
		()
		(15 
			(11 () ())
			()					
		) 		
	)
)

(define (search x tree)
	(cond 
		((null? tree) #f)
		((= x (car tree)) #t)
		(else (if (< x (car tree))
					(search x (cadr tree))
					(search x (caddr tree))
				)
		)		
	) 
)

(display "=== Binary search trees ===\n")
(search 
	3
	'(8
		(5 
			(2 () ())
			(7 () ())
		)
		(9 
			()
			(15 
				(11 () ())
				()					
			) 		
		)
	)
)

;; === Maximum degree in a graph ===

'((a b c) (b a c d) (c a b) (d b))

(define (maxDegree graph)
	(if (null? graph)
		0
		(max (- (length (car graph)) 1) (maxDegree (cdr graph)))
	)
)

(display "=== Maximum degree in a graph ===\n")
(maxDegree '((a b c) (b a c d) (c a b) (d b)))