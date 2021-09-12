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

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (adjoin-position new-row k rest-of-queens)
  (append (list new-row) rest-of-queens))

(define (safe? k positions)
  (define (iter k pos number-queens rest-of-queens)
    (cond ((= number-queens 0) #t)
          ((= k 1) #t)
          ((or (= pos (car rest-of-queens))
               (= (abs (- k number-queens)) (abs (- pos (car rest-of-queens)))))
           #f)
          (else (iter k pos (- number-queens 1) (cdr rest-of-queens)))))
  (iter k (car positions) (- k 1) (cdr positions)))

(define empty-board null)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(length (queens 8))


