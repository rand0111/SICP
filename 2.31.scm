#lang racket
(define (square x) (* x x ))

(define (tree-map-simple tree function)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (function tree))
        (else (cons (tree-map-simple (car tree) function) (tree-map-simple (cdr tree) function)))))

(define (tree-map tree function)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map sub-tree function)
             (function sub-tree)))
       tree))
(define (square-tree tree)
  (tree-map-simple tree square))
(define (square-tree-m tree)
  (tree-map tree square))


(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(square-tree-m
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))