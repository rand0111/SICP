#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (c-l x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (c-l (car x))
                 (c-l (cdr x))))))

(define (count-leaves t)
  (accumulate + 0 (map c-l t)))

(define x (list (list 1 2) 3 4 (list 1 (list 5 6)) 3 4))
(count-leaves x)
