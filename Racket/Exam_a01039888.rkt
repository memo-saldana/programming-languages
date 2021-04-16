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

(define (exam.takeif lst n f)
	(if (or (null? lst) (equal? n 0))
		'()
		(if (f (car lst))
			(cons (car lst) (exam.takeif (cdr lst) (- n 1) f))
			(exam.takeif (cdr lst) n f)
		)

	)
)

(display "=== exam.takeif ===\n")
(exam.takeif '(10 3 15 12 18 9 11 6 10) 3 (lambda (x) (> x 10))) ;; '(15 12 18)
(exam.takeif '(a b 1 2 3 c d 4 e f 5 g 6 7 h) 5 number?) ;; '(1 2 3 4 5)
(exam.takeif '(10 26 17 20) 6 even?) ;; '(10 26 20)

(define (exam.dropif lst n f)
	(display "Not yet implemented\n")
)

(display "=== exam.dropif ===\n")
(exam.dropif '(10 3 15 12 18 9 11 6 10) 3 (lambda (x) (> x 10))) ;; '(10 3 9 11 6 10)
(exam.dropif '(a b 1 2 3 c d 4 e f 5 g 6 7 h) 5 number?) ;; '(a b c e f g 6 7 h)
(exam.dropif '(10 26 17 20) 6 even?) ;; '(17)

;; === exam.leaves ===

(define (exam.leaves tree)
	(display "Not yet implemented\n")
)

(display "=== exam.leaves ===\n") 
(exam.leaves '(8 (5 (2 () ()) (7 () ())) (9 () (15 (11 () ()) ())))) ;; '(2 7 11)
(exam.leaves '(3 () (5 (4 () ()) (8 (7 () ()) ())))) ;; '(4 7)

;; === exam.depth ===

(define (exam.depth x tree)
	(cond 
		[(null? tree) 0]
		[(equal? (car tree) x) 0]
		[(> (car tree) x) (+ 1 (exam.depth x (cadr tree)))]
		[else (+ 1 (exam.depth x (caddr tree)))]
	)
)

(display "=== exam.depth ===\n") 
(exam.depth 8 '(8 (5 (2 () ()) (7 () ())) (9 () (15 (11 () ()) ())))) ;; 0
(exam.depth 11 '(8 (5 (2 () ()) (7 () ())) (9 () (15 (11 () ()) ())))) ;; 3
(exam.depth 4 '(3 () (5 (4 () ()) (8 (7 () ()) ())))) ;; 2

;; === exam.sdiag ===

(define (exam.sdiag m)
    (display "Not yet implemented\n")
)

(display "=== exam.sdiag ===\n") 
(exam.sdiag '((1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 16))) ;; '(4 7 10 13)
(exam.sdiag '((2 4 6 8) (10 12 14 16) (18 20 22 24) (26 28 30 32))) ;; '(8 14 20 26)

;; === exam.map ===

(define (exam.map f lst)
	(if (null? lst)
		'()
		(cons (f (car lst)) (exam.map f (cdr lst)))
	)
)

(display "=== exam.map ===\n")
(exam.map sqrt '(1 4 9 16 25)) ; '(1 2 3 4 5)
(exam.map (lambda (x) (+ x 2)) '(10 20 30 40 50)) ; '(12 22 32 42 52)
(exam.map list '(a b c)) ; '((a) (b) (c))

;; === exam.select ===

;; This should not be done! (but it helps)
(define grades 
	'(
		("id" "g1" "g2" "g3")
	 	(796623 62 84 91)
	 	(782544 81 89 77)
	 	(790256 59 62 63)
	 	(799610 75 68 82)
	 	(791313 85 56 92)
	 	(786621 98 97 92)
	 	(809706 91 72 80)
	 )
)

(define theLeaveAlones 
	'(
		("name" "height" "enemy")
		("John Wick" 182 "Everyone")
		("Ellen Ripley" 173, "Xenomorph")
		("Beatrix Kiddo" 175, "Bill")
	 )
)

(define (transposeHelper table)
	(if (null? (car table))
		'()
		(cons (map car table) (transposeHelper (map cdr table)))
	)
)

(define (exam.select table cols)
	(transposeHelper ; returns table to original form
		(filter
			(lambda (row)  (member (car row) cols)) ; filters by column header (which is now 1st item in row)
			(transposeHelper table) ; transposes table
		)
	)
)

(display "=== exam.select ===\n")
(exam.select grades '("g1" "g2")) ;; '(("g1" "g2") (62 84) (81 89) (59 62) (75 68) (85 56) (98 97) (91 72))
(exam.select grades '("id")) ;; '(("id") (796623) (782544) (790256) (799610) (791313) (786621) (809706))
(exam.select theLeaveAlones '("name" "enemy")) ; '(("name" "enemy") ("John Wick" "Everyone") ("Ellen Ripley" ,"Xenomorph") ("Beatrix Kiddo" ,"Bill"))
(exam.select theLeaveAlones '("enemy" "height")) ; '(("height" "enemy") (182 "Everyone") (173 ,"Xenomorph") (175 ,"Bill"))

;; === exam.insert ===

;; This should not be done! (but it helps)
(define patients '((name height) ("John Wick" 182) ("Ellen Ripley" 173) ("Beatrix Kiddo" 175)))

(define (exam.insert table col index)
	(display "Not yet implemented\n")
)

(display "=== exam.insert ===\n")
(exam.insert theLeaveAlones '("weight" 92 73 75) 0) ;; '((weight name height) (92 "John Wick" 182) (73 "Ellen Ripley" 173) (75 "Beatrix Kiddo" 175))
(exam.insert theLeaveAlones '("weight" 92 73 75) 1) ;; '((name weight height) ("John Wick" 92 182) ("Ellen Ripley" 73 173) ("Beatrix Kiddo" 75 175))
(exam.insert grades '("final" 100 100 75 100 90 85 70) 4) ;; '(("id" "g1" "g2" "g3" "final") (796623 62 84 91 100) (782544 81 89 77 100) (790256 59 62 63 75) (799610 75 68 82 100) (791313 85 56 92 90) (786621 98 97 92 85) (809706 91 72 80 70))