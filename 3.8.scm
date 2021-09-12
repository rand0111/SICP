#lang racket
(define f
  (let ((closed 'undefined))
    (lambda (arg)
    (if (eq? closed 'undefined)
        (begin (set! closed 0)
           arg)
        closed))))
(f 1)
(f 1)
(+ (f 1) (f 0))

 (define f1
   (let ((count 1)) 
     (lambda (x)  
        (set! count (* count x)) 
        count)))
