#lang racket
(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))

(define (make-point x y)
  (cons x y))

(define (square x) (* x x))

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

(define (rectangle a b)
  (make-segment a b))

(define (segment-length-points point1 point2)
  (sqrt (+ (square(- (x-point point1) (x-point point2)))
           (square(- (y-point point1) (y-point point2))))))

(define (segment-length segment)
  (segment-length-points (start-segment segment) (end-segment segment)))

(define (side-a rectangle)
  (let ((start-p (start-segment rectangle))
        (end-p (end-segment rectangle)))
    (define vert-p (make-point (x-point start-p) (y-point end-p)))
    (make-segment start-p vert-p)))

(define (side-b rectangle)
  (let ((start-p (start-segment rectangle))
        (end-p (end-segment rectangle)))
    (define horiz-p (make-point (x-point end-p) (y-point start-p)))
    (make-segment start-p horiz-p)))

(define (rect-area rectangle)
  (let ((a (side-a rectangle))
        (b (side-b rectangle)))
    (* (segment-length a) (segment-length b))))
    
(define (rect-perim rectangle)
  (let ((a (side-a rectangle))
        (b (side-b rectangle)))
    (* (+ (segment-length a) (segment-length b)) 2)))

(define a1 (make-point 1 1))
(define a2 (make-point 6 4))
(define a12 (make-segment a1 a2))
(define x (rectangle a1 a2))
(rect-area x)
(rect-perim x)
