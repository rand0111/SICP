#lang racket
(define tolerance 0.00001)
(define (average a b)
  (/ (+ a b) 2))

(define(print guess iter)
  (display iter)
  (display ": ")
  (display guess)
  (newline))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))  
  (define (try guess iterration)
    (print guess iterration)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ iterration 1)))))
  (try first-guess 1))


(fixed-point (lambda (x) (+ 1 (/ 1 x)))
             1)

(fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
             2)

(fixed-point (lambda (x) (/ (log 1000) (log x)))
             2)