#lang racket
(define (square x) * x x )
(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) x)
          ((eq? op 'imag-part) y)
          ((eq? op 'magnitude)
           (sqrt (+ (square x) (square y))))
          ((eq? op 'angle) (atan y x))
          (else
           (error "Unknown operation -- MAKE-FROM-REAL-IMAG" op))))
  dispatch)
((make-from-real-imag 5 6) 'real-part)

(define (с r a)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          ((eq? op 'real-part) (* r (cos a)))
          ((eq? op 'imag-part) (* r (sin a)))
          (else
           (error "Unknown operation -- make-from-real-imag" op))))
  dispatch)
                                
((make-from-real-imag 3 4) 'magnitude)