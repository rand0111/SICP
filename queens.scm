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

(define x (list (list (list 2 1) (list 1 1))
                (list (list 2 2) (list 1 1))
                (list (list 2 3) (list 1 1))
                (list (list 2 4) (list 1 1))))
;(filter (lambda (positions) (safe? k positions))
;        x)
(define y (list (list (list 2 5) (list 1 1))))
(define i (append y x))


(define (tes k i)
  (flatmap (lambda (x)
           (map (lambda (y)
             (append (list (list k y)) x))
           (enumerate-interval 1 4)))
           i))
(tes 3 i)

(define (safe? k positions)
  (define (inside k p positions)
    (let ((k-of-pos (car (car positions)))
          (p-of-pos (car (cdr (car positions)))))
    (if (null? (positions))
        #t
        (if (or (= (- k k-of-pos)
                   (- p p-of-pos))
                (= p p-of-pos))
            #f
            (inside k p (cdr positions))))))
  (inside k (car (cdr (car positions))) (cdr positions)))
(filter (lambda (pos) (safe? 3 pos)) (tes 3 i))
