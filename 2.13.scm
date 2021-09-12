#lang racket
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))

(define (make-center-percent center percent)
  (let ((difference (* center (/ percent 100))))
    (make-interval (- center difference) (+ center difference))))

(define (percent interval)
  (- 100 (* (/ (lower-bound interval) (center interval)) 100)))

(define x (make-center-percent 8 10))
(define y (make-center-percent 6 20))
(par1 x y)
(par2 x y)
(define a (make-center-percent 10 0.005))
(define b (make-center-percent 100 0.03))
(par1 a b)
(par2 a b)
(percent (div-interval x x))
(percent (div-interval y y))




