#lang racket
(define (square x) (* x x))

(define (less-or-eq? a b)
  (or (= a b) (< a b)))
(define (make-point a b)
  (cons a b))
(define (x-c point)
  (car point))
(define (y-c point)
  (cdr point))
(define (radius upper-bound center)
  (- (x-c upper-bound) (x-c center)))
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))


(define (in-circle? point predicate radius)
  (let ((sum-of-squares (+ (square (- (x-c point) (x-c predicate))) (square (- (y-c point) (y-c predicate))))))
        (less-or-eq? sum-of-squares (square radius))))


(define (estaimateintegral predicate upper-bound lower-bound num-trials)
  (define (test-point)
    (let ((point-to-test (make-point (random-in-range (x-c lower-bound) (x-c upper-bound))
                               (random-in-range (y-c lower-bound) (y-c upper-bound)))))
      (in-circle? point-to-test predicate (radius upper-bound predicate))))
  (monte-carlo num-trials test-point))

(define (estimate-pi trials)
  (* (square (- (x-c up) (x-c low))) (estaimateintegral point1 up low trials)))

(define point1 (make-point 0 0))
(define low (make-point -10 -10))
(define up (make-point 10 10))
(/ (/ (estimate-pi 10000000) 100) 1.0)