#lang racket
(define (element-of-set? x set)
(cond ((null? set) false)
      ((= x (car set)) true)
      ((< x (car set)) false)
      (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
   (cond ((null? set) (list x))
         ((= x (car set)) set)
         ((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
         ((< x (car set)) (cons x set))))

(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((null? set1) set2)
        (else
         (let ((x1 (car set1))
               (x2 (car set2)))
           (cond ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                 ((> x1 x2) (cons x2 (union-set set1 (cdr set2))))
                 ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                 (else (error "unnown error")))))))
(union-set (list 1 2 4 5 8) (list 4 5 6 8 ))