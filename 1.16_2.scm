#lang racket
(define (d-mult a b)
  (cl-mult a b))

(define (double a ) (* 2 a))

(define (half a) (/ a 2))

(define (cl-mult a b)
  (if (= b 1) a
             (if (even? b)
                 (double (cl-mult a (half b)))
                 (+ a (cl-mult a (- b 1))))))
       