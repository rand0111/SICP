#lang racket
(define (cont-frac-i d n counter)
  (define (helper result counter)
    (if (= counter 0)
        result
        (helper (/ (n counter) (+ (d counter) result)) (- counter 1))))
  (helper 1 counter))

(define (tan-cf x k)
  (/ x (- 1 (cont-frac-i (lambda (i) (- (* i 2) 1)) (lambda (i) (* i i)) k))))

(tan-cf (/ 3.14 4) 2000)
