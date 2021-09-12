#lang racket
(define (v2 x)
  (let (counted '())
    (define (count-pairs x)
      (if (or (not (pair? x)) (memq x counted))
          0
          (begin (set! counted (cons x counted))
                 (+ (count-pairs (car x))
                    (count-pairs (cdr x))
                    1)))))
    (count-pairs x))