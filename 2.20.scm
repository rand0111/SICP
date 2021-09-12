#lang racket
(define (numbers-same-parity x y)
  (or (and (even? x) (even? y)) (and (odd? x) (odd? y))))
(define (filter x)
  (if (even? x)
      even?
      odd?))

(define (same-parity1 x . y)
  (if (null? y)
      (list)
      (if ((filter x) (car y))
          (cons (car y) (same-parity1 x . (cdr y)))
          (same-parity1 x . (cdr y)))))
(same-parity1 1 2 3 4 5 6 7)

(define (same-parity x . y)
  (define (iter x y result)
    (if (null? y)
        result
        (if (numbers-same-parity (car y) x)
            (iter x (cdr y) (cons (car y) result))
            (iter x (cdr y) result))))
  (iter x y (list x)))
;(same-parity 1 2 3 4 5 6 7)
