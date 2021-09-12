#lang racket
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (accum-iter a accumulator)
    (if (> a b)
        accumulator
        (accum-iter (next a) (combiner accumulator (term a)))))
  (accum-iter a null-value)) 
      

(define (id x) x)

(define (inc x) (+ x 1))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

(sum id 0 inc 4)

(define (product term a next b)
  (accumulate-iter * 1 term a next b))

(product id 1 inc 4)