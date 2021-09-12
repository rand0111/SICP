#lang racket
(define (power-n base n)
  (define (iter result base counter n)
    (if (> counter n)
        result
        (iter (* result base) base (+ 1 counter) n)))
  (iter 1 base 1 n))

(define (power-2 n)
  (power-n 2 n))
(define (power-3 n)
  (power-n 3 n))

(define (cons a b)
  (* (power-2 a) (power-3 b)))
(define x (cons 7 5))

(define (car1 x)
  (define (power-car x)
    (if (not (= (remainder x 3) 0))
        x
        (power-car (/ x 3))))
  (/ (log (power-car x)) (log 2)))
(car1 x)

(define (cdr1 x)
  (define (power-cdr x)
    (if (not (= (remainder x 2) 0))
        x
        (power-cdr (/ x 2))))
  (/ (log (power-cdr x)) (log 3)))
(cdr1 x)

(define (times x base)
  (define (iter x base i)
    (if (not (= (remainder x base) 0))
        i
        (iter (/ x base) base (+ i 1))))
    (iter x base 0))

(define (car x)
  (define (power-car x)
    (if (not (= (remainder x 3) 0))
        x
        (power-car (/ x 3))))
  (times x 2))
(car x)

(define (cdr x)
  (define (power-car x)
    (if (not (= (remainder x 2) 0))
        x
        (power-car (/ x 2))))
  (times x 3))
(cdr x)   
      
  