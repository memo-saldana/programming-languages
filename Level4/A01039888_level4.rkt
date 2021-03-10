#lang racket


(define (sublst x y lst)
  (if (null? lst)
    '()
    (if (eq? x (car lst))
      (if (eq? (length lst) 1) ; if only one value in list, return it as is for reverse case
        lst ; in this case, y doesnt matter, it will always return that number regardless
        (if (null? (cdr (sublst x y (reverse lst)))) ; sublst will always have one value
          lst
          (reverse (sublst x y (reverse lst)))
        )
      )
      (if (eq? y (car lst))
        lst
        (sublst x y (cdr lst))
      )
    )
  )
)

(define (sublistL4 x y lst)
  (if (null? (sublst x y lst))
    lst
    (sublst x y lst)
  )
)


(sublistL4 5 3 '(10 5 7 9 3 2 1)) ; '(5 7 9 3)
(sublistL4 15 3 '(10 5 7 9 3 2 1)) ; '(3 2 1)
(sublistL4 5 13 '(10 5 7 9 3 2 1)) ; '(5 7 9 3 2 1)
(sublistL4 15 13 '(10 5 7 9 3 2 1)) ; '(10 5 7 9 3 2 1)