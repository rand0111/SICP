#lang racket
(define (equal? a1 a2)
  (cond ((and (not (pair? a1)) (not (pair? a2))) (eq? a1 a2))
        ((and (pair? a1) (pair? a2)) (and (equal? (car a1) (car a2)) (equal? (cdr a1) (cdr a2))))
        (else #f)))
(equal? '(1 2 3 (4 5) 6) '(1 2 (3 4 5) 6))