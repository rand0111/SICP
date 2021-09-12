#lang racket
(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (repeated (compose f f) (- n 1))))

((repeated square 2) 5)

(define (repeated2 f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated2 f (- n 1)))))

((repeated2 square 2) 5)

