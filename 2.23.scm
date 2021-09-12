#lang racket
(define (for-each function items)
  (function (car items))
  (if (null? (cdr items))
      #t
      (for-each function (cdr items))))
(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4))

