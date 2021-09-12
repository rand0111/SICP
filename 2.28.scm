#lang racket
(define x (list (list 1 2) (list 3 4)))
(define (reverse1 list1)
  (define (inside list1 result)
    (if (null? list1)
        result
        (inside (cdr list1) (cons (car list1) result))))
  (inside list1 (list)))

(define (append1 list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append1 (cdr list1) list2))))
;version 1
(define (fringe list-of-lists)
  (define (add-number? list-of-lists result)
    (if (number? (car list-of-lists))
        (cons (car list-of-lists) result)
        (inside (car list-of-lists) result)))
  
  (define (inside list-of-lists result)
    (if (null? list-of-lists)
        result
        (inside (cdr list-of-lists) (add-number? list-of-lists result))))
  (inside list-of-lists (list)))
        
(reverse1 (fringe x))

;version 2
(define (fringe2 list-of-lists)
  (define (add-number? list-of-lists result)
    (if (number? (car list-of-lists))
        (append result (list (car list-of-lists)))
        (inside (car list-of-lists) result)))
  
  (define (inside list-of-lists result)
    (if (null? list-of-lists)
        result
        (inside (cdr list-of-lists) (add-number? list-of-lists result))))
  (inside list-of-lists (list)))

(fringe2 x)

;version 3
 (define (fringe3 tree) 

   (define (build-fringe x result) 
     (cond ((null? x) result) 
           ((not (pair? x)) (cons x result)) 
           (else (build-fringe (car x)  
                               (build-fringe (cdr x) result))))) 
  
   (build-fringe tree (list)))
(fringe3 x)