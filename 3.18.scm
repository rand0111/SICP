#lang racket
(define infi (list 'a 'b 'c))
(set-cdr! (cdr infi) infi)

(define (loop-cheker x)
  (define (helper x y)
    (cond ((not (pair? y)) #f)
          ((eq? x y) #t)
          (else (or (helper (car y) x) (helper (cdr y) x)))))
  (helper x x))
(loop-cheker infi)
