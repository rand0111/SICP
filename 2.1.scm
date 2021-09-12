#lang racket
(define (make-rat n d)
  (let ((g (* (gcd n d) (sign d)))) 
    (cons (/ n g) (/ d g))))

(define (sign x)
  (if (< x 0)
      -1
      1))
(make-rat 1 -2)