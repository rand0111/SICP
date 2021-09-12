#lang racket
(define (square x) (* x x))

(define (inc x) (+ x 1))

  
(define (prime? n)
  (define (divides? a b)
    (= (remainder b a) 0))

  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

  (define (smallest-divisor n)
    (find-divisor n 2))
  
  (= n (smallest-divisor n)))

  
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (filter a)
           (term a)
           null-value)
       (filtered-accumulate filter combiner null-value term (next a) next b))))

(filtered-accumulate prime? + 0 square 1 inc 4)

 (define (gcd m n) 
   (cond ((< m n) (gcd n m)) 
         ((= n 0) m) 
         (else (gcd n (remainder m n))))) 
  
 (define (relative-prime? m n)
   (= (gcd m n) 1)) 
  
 (define (product-of-relative-primes n) 
   (define (filter x) 
     (relative-prime? x n)) 
 (filtered-accumulate * 1 identity 1 inc n filter)) 



