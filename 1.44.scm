#lang racket
(define (smooth f)
  (define dx 0.0001)
  (lambda (x) (/ (+ (f x)
                    (f (+ x dx))
                    (f (- x dx)))
                 3)))
(define (cube x) (* x x x))


(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated2 f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated2 f (- n 1)))))

(((repeated2 smooth 2) cube) 2)

(define (n-fold-smooth f n) 
  ((repeated smooth n) f))



