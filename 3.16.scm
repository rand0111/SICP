#lang racket
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define pair3 (list 'a 'b 'c))

(define A (cons 'a null))
(define B (cons A null))
(define pair4 (cons B A))
(count-pairs pair4)

(define C (cons 'a null))
(define D (cons C C))
(define pair7 (cons D D))
(count-pairs pair7)

(define infi (list 'a 'b 'c))
(set-cdr! (cdr infi) infi)
(count-pairs infi)