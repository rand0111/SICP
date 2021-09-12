#lang racket
; Trash function, may have use inb future
(define (i-element i list1)
  (if (= i 0)
      (car list1)
      (i-element (- i 1) (cdr list1))))

(define (length list1)
  (if (null? (cdr list1))
      1
      (+ 1 (length (cdr list1)))))

(define (reversed1 list1)
  (define (inside n list1 reversed)
    (if (= n 0)
        reversed
        (inside (- n 1) list1 (append (list (i-element (- n 1) list1)) reversed))))
  (inside (length list1) list1 (list)))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(define k (list 1 2 3))

(define (reversed2 list1)
  (define (inside list1 reversed)
    (if (null? list1)
        reversed
        (inside (cdr list1) (append (list (car list1)) reversed))))
  (inside list1 (list)))

;solutionы
(define (reversed list1)
  (define (inside list1 reversed)
    (if (null? list1)
        reversed
        (inside (cdr list1) (cons (car list1) reversed))))
  (inside list1 (list)))
k
(reversed k)