#lang racket
(define (deep-reverse list-of-lists)
  (define (inside list-of-lists result)
    (if (null? list-of-lists)
      result
      (if (number? (car list-of-lists))
          (inside (cdr list-of-lists) (cons (car list-of-lists) result))
          (inside (cdr list-of-lists) (cons (deep-reverse (car list-of-lists)) result)))))
  (inside list-of-lists (list)))
(deep-reverse (list (list 1 2) (list 3 4)))


;bad refactoring
(define (deep-reverse2 list-of-lists)
  
  (define (deeper? list-of-lists)
    (if (number? list-of-lists)
        (car list-of-lists)
        (deep-reverse2 (car list-of-lists))))
  
  (define (inside list-of-lists result)
    (if (null? list-of-lists)
      result
      (inside (cdr list-of-lists) (cons (deeper? list-of-lists) result))))
  
  (inside list-of-lists (list)))


(deep-reverse2 (list (list 1 2) (list 3 4)))


