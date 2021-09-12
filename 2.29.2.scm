#lang racket
(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
   (cdr mobile)) 
(define (branch-length branch) 
   (car branch)) 
(define (branch-structure branch) 
   (cdr branch))
(define (total-weight mobile) 
  (if (not (pair?  mobile))
           mobile
           (+ (total-weight (branch-structure (left-branch mobile)))
              (total-weight (branch-structure (right-branch mobile)))))) 
(define a (make-mobile (make-branch 2 3) (make-branch 2 4))) 
(total-weight a) ;; 6
(branch-structure (branch-structure a))

(define (torque mobile)
  (* (left-branch mobile) (right-branch mobile)))

 (define (balanced? mobile) 
   (if (not (pair? mobile)) 
       true 
       (and (= (torque (left-branch mobile)) (torque (right-branch mobile))) 
            (balanced? (branch-structure (left-branch mobile))) 
            (balanced? (branch-structure (right-branch mobile)))))) 

(pair? (cdr (cdr a)))
(balanced? a)

