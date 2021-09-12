#lang racket
(define (rand arg)
  (let ((x 'undefined))
    (define (inside)
      (cond ((eq? arg 'generate)
         (lambda ()
           (set! x (rand-update x))
           x))
        ((eq? arg 'reset)
         (lambda (num) (set! x (rand-update num))
           x))))
    (inside)))
((rand 'reset) 2)
;wrong