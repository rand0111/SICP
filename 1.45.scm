#lang racket
;helper functions
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated-v2 f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated-v2 f (- n 1)))))

(define (square x) (* x x))
(define (power x n)
  (if (< n 1)
      1
      (* x (power x (- n 1)))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)
(define (average a b)
  (/ (+ a b) 2))

(define(print guess iter)
  (display iter)
  (display ": ")
  (display guess)
  (newline))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.0001)

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

;procedure that return number of times needs to use average-damp with respect to n
(define (repeat-times n) 
  (define (iter times i)
    (if (> i n)
        times
        (iter (+ times 1) (* i 2))))
    (iter 2 7))

;Newton method fixed point(derivative)
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

(sqrt 2)

(define (power-root x n)
  (newtons-method (lambda (y) (- (power y n) x)) 1.0))

(power-root 5 40)

;Newton method old style
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))
(cube-root 3)

(define (power-root2 x n)
  (fixed-point ((repeated-v2 average-damp (repeat-times n)) (lambda (y) (/ x (power y (- n 1))))) 1.0))

(power-root2 5 32)

