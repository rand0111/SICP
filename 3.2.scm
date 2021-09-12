#lang racket
(define (square x) (* x x))
(define (make-monitored funk)
  (let ((counter 0))
        (lambda (arg)
          (if (eq? arg 'how-many-calls?)
              counter
              (begin (set! counter (+ counter 1))
                     (funk arg))))))
(define s (make-monitored square))
(s 3)
(s 4)
(s 10)
(s 'how-many-calls?)