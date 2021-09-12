#lang racket
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

(define (fold-right op initial sequence)
  (accumulate op initial sequence)) 
  

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))
(reverse (list 4 3 2 1))


(define (reverse1 sequence)
  (fold-left (lambda (x y) (append (list y) x)) null sequence))
(reverse1 (list 4 3 2 1))