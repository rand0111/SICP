#lang racket
(define (square x) (* x x))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-rect a b)
  (cons a b))

(define (a-line rectangle)
  (car rectangle))

(define (b-line rectangle)
  (cdr rectangle))

(define (rectangle A B C D)
  (let ((a (make-segment A B))
        (b (make-segment A C)))
    (make-rect a b)))

(define (segment-length-points point1 point2)
  (sqrt (+ (square(- (x-point point1) (x-point point2)))
           (square(- (y-point point1) (y-point point2))))))

(define (segment-length segment)
  (segment-length-points (start-segment segment) (end-segment segment)))

(define (area-rectangle rectangle)
  (let ((a (segment-length (a-line rectangle)))
        (b (segment-length (b-line rectangle))))
    (* a b)))

(define (perim-rectangle rectangle)
  (let ((a (segment-length (a-line rectangle)))
        (b (segment-length (b-line rectangle))))
    (* (+ a b) 2)))

(define A (make-point 1 1))
(define B (make-point 1 4))
(define C (make-point 6 1))
(define D (make-point 6 4))
(define x (rectangle A B C D))
(area-rectangle x)
(perim-rectangle x)