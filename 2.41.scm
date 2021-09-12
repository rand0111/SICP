#lang racket
(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high) 
   (if (> low high) 
       null 
       (cons low (enumerate-interval (+ low 1) high))))

(define (fun n)
  (accumulate append
            null
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (seq n)
  (flatmap (lambda (i)
   (flatmap (lambda (j)
              (map (lambda (k) (list i j k))
                   (enumerate-interval 1 n)))
              (enumerate-interval 1 n)))
            (enumerate-interval 1 n)))

(define (first set-of-3) (car set-of-3))
(define (second set-of-3) (car (cdr set-of-3)))
(define (thirs set-of-3) (car (cdr (cdr set-of-3))))
(define (set-of-3 n)
  (filter (lambda (x)
            (not (or (= (first x) (second x))
                         (= (first x) (third x))
                         (= (second x) (third x)))))
          (seq n)))

(define (sets-proc n s)
  (filter (lambda (x) (= (+ (first x) (second x) (third x)) s)) (set-of-3 n)))

(sets-proc 5 6)
                