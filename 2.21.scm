#lang racket
(define (square x) (* x x))
(define (square-list items)
  (if (null? items)
      items
(cons (square (car items)) (square-list (cdr items)))))


(square-list (list 1 2 3 4))

(define (map-square-list items)
  (map square items))
(map-square-list (list 1 2 3 4))