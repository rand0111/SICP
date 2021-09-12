#lang racket
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a)  next b))))

(define (product-iter term a next b)
  (define (iter a accumulator)
    (if (> a b)
        accumulator
        (iter (next a) (* accumulator (term a)))))
  (iter a 1))
      
(define (factorial n)
  (define (inc x) (+ x 1))
  (define (id x) x)
  (product-iter id 1 inc n))

(factorial 5)

(define (pi n)
  (define (term-pi n)
    (if (even? n)
        (/ (+ 2 n) (+ 1 n))
        (/ (+ 1 n) (+ 2 n))))
  (define (inc x) (+ x 1))
  (product term-pi 1 inc n))

(pi 300)












