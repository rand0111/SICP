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

(enumerate-interval 1 6)
(define (fun n)
  (accumulate append
            null
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n))))
(define (flatmap proc seq)
(accumulate append null (map proc seq)))

(fun 6)
(define k (map (lambda (x) (map (lambda (y) (list x y)) (enumerate-interval 1 5))) (enumerate-interval 6 9)))
k
(define x (enumerate-interval 1 5))
x
(flatmap (lambda (i)
   (map (lambda (j) (list i j))
        (enumerate-interval 1 5)))
 (enumerate-interval 6 9))