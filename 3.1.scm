#lang racket
(define (make-accumulator value)
  (let ((accum value))
     (lambda (amount)
       (begin (set! accum (+ accum amount))
              accum))))

(define A (make-accumulator 4))

(define (sqrt x) (* x x))

(define (make-monitored proc)
  (lambda (arg)