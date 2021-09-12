#lang racket
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (average a b)
  (/ (+ a b) 2))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (let ((a (start-segment segment))
        (b (end-segment segment)))
    (make-point
     (average (x-point a)
              (x-point b))
     (average (y-point a)
              (y-point b)))))

(define a1 (make-point 2 3))
(define a2 (make-point 7 8))
(define a1a2 (make-segment a1 a2))
(print-point a1a2)
(midpoint-segment a1a2)