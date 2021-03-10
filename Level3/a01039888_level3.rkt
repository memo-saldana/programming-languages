#lang racket

(define (sublistL3 x y lst)
  (cond
    [(and (eq? x (car lst)) (eq? y (car (reverse lst)))) lst]
    [(eq? x (car lst))  (sublistL3 x y (reverse (cdr (reverse lst))))]
    [(eq? y (car (reverse lst))) (sublistL3 x y (cdr lst))]
    [else (sublistL3 x y (reverse (cdr (reverse (cdr lst)))))]
  )
)


(sublistL3 5 3 '(10 5 7 9 3 2 1)) ; '(5 7 9 3)