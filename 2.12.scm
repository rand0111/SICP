#lang racket
(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))

(define (make-center-percent center percent)
  (let ((difference (* center (/ percent 100))))
    (make-interval (- center difference) (+ center difference))))

(define (percent interval)
  (- 100 (* (/ (lower-bound interval) (center interval)) 100)))
