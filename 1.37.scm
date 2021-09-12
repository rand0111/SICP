#lang racket
(define (cont-frac d n counter)
  (if (= counter 0)
      0
      (/ (n counter) (+ (d counter) (cont-frac d n (- counter 1))))))
(/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10))

(define (cont-frac-i d n counter)
  (define (helper result counter)
    (if (= counter 0)
        result
        (helper (/ (n counter) (+ (d counter) result)) (- counter 1))))
  (helper 1 counter))
(/ 1 (cont-frac-i (lambda (i) 1.0) (lambda (i) 1.0) 100))

 
