#lang racket
(define (d-mult a b)
  (cl-mult a b))

(define (double a ) (* 2 a))

(define (half a) (/ a 2))

(define (cl-mult a b)
  (cond ((= b 1) a)
        ((even? b) (double (cl-mult a (half b))))
        (else (+ a (cl-mult a (- b 1))))))

(d-mult 5 12)