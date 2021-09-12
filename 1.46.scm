#lang racket
(define tolerance 0.0001)

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ y x) 2)) 

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess 
        ((iterative-improve good-enough? improve) (improve guess)))))

(define (sqrt x)
  ((iterative-improve (lambda (y) (< (abs (- x (square y))) tolerance))
                     (lambda (y) (average y (/ x y)))) 1.0))
(sqrt 2)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 0.001))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (x) (< (abs (- x (f x))) tolerance))
                     f) first-guess))

(fixed-point cos 0.2)


  