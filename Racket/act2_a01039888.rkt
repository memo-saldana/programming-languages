#lang racket

(define (sumList n)
  (if (null? n)
    0
    (if (number? (car n))
      (+ (car n) (sumList (cdr n)))
      (sumList (cdr n))
    )
  )
)
(sumList '(1 2 3 4))


(define (pal s)
  (equal?  s  (reverse s))
)
(pal '(1 2 2 1))


(define (myreverse lst)
  (if (null? lst)
    '()
    (append (myreverse (cdr lst)) (list (car lst)))
  )
)
(myreverse '(1 2 3))


(define (getItem lst index)
  (if (and (>= index 0) (< index (length lst)))
    (if (= index 0)
      (car lst)
      (getItem (cdr lst) (- index 1))
    )
    '()
  )
)
(getItem '(1 2 3 4) 1)

(define (getOdds lst)
  (if (> (length lst) 1)
    (cons (cadr lst) (getOdds (cddr lst)))
    '()
  )  
)
(getOdds '(1 2 3 4 5))
