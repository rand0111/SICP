#lang racket
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
   (car (cdr mobile))) 
(define (branch-length branch) 
   (car branch)) 
(define (branch-structure branch) 
   (car (cdr branch)))

(define (total-weight mobile)
  (+ (branch-structure (left-branch mobile)) (branch-structure (right-branch mobile))))

(define (balanced? mobile)
  (equal? (* (branch-structure (left-branch mobile))
             (branch-length (left-branch mobile)))
          (* (branch-structure (right-branch mobile))
             (branch-length (right-branch mobile)))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3))) 

(define b (make-mobile (make-branch 10 a) (make-branch 12 5)))
(total-weight b) ;; 6
(balanced? b)
