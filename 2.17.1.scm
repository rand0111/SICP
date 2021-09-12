#lang racket
(define (last-pair list)
  (define (lenght list)
    (if (null? list)
        0
        (+ 1 (length (cdr list)))))
  (define (n-slise n list)
    (if (= (length list) n)
      list
      (n-slise n (cdr list))))
  (n-slise 1 list))

(last-pair (list 23 72 149 34))
