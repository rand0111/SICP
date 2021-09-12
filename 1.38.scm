#lang racket
 (define (d-func i)
   (if (= (remainder (+ i 1) 3) 0)
       (/ (+ i 1) 1.5)
       1))

(define (cont-frac n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))
(/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10))

(define (cont-frac-i n d counter)
  (define (helper result term)
    (if (= term 0)
        result
        (helper (/ (n term) (+ (d term) result)) (- term 1))))
  (helper 0 counter))
(/ 1 (cont-frac-i (lambda (i) 1.0) (lambda (i) 1.0) 100))

(define (e-euler-m k)
  (+ 2.0 (cont-frac-i (lambda (i) 1) d-func k)))
(e-euler-m 100)

(define (e-euler k)
  (+ 2.0 (cont-frac-i (lambda (i) 1)
                      (lambda (i) 
                      (if (= (remainder i 3) 2)
                          (/ (+ i 1) 1.5) 
                          1))
                      k)))
(e-euler 100)