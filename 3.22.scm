#lang sicp
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?) (null? front-ptr))
    (define (front-func front-queue)
      (if (empty-queue?)
          (error "FRONT вызвана с пустой очередью" front-ptr)
          (car front-ptr)))
    (define (set-f-func item) (set! front-ptr item))
    (define (set-r-func item) (set! rear-ptr item))    
    (define (insert-func item)
      (let ((new-pair (cons item '())))
    (cond ((empty-queue?)
           (set-f-func new-pair)
           (set-r-func new-pair)
           front-ptr)
          (else
           (set-cdr! rear-ptr new-pair)
           (set! rear-ptr new-pair)
           front-ptr))))
    (define (delete-func)
      (cond ((empty-queue?)
         (error "DELETE! вызвана с пустой очередью" front-ptr))
        (else
         (set-f-func (cdr front-ptr))
         front-ptr)))
(define (print-func)
  (display front-ptr)
          (newline))
    
    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) (empty-queue?))
            ((eq? m 'front-queue) (front-func front-ptr))
            ((eq? m 'insert-queue) insert-func)
            ((eq? m 'delete-queue) (delete-func))
            ((eq? m 'print-queue) (print-func))
            ((eq? m 'front-ptr) front-ptr)
            ((eq? m 'rear-ptr) rear-ptr)))
   
dispatch))


(define q1 (make-queue))
(q1 'empty-queue?)
((q1 'insert-queue) 'a)
(q1 'print)
((q1 'insert-queue) 'b)
(q1 'print-queue)
(q1 'delete-queue)
(q1 'print-queue)
(q1 'delete-queue)
(q1 'print-queue)
