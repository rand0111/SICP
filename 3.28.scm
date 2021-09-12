#lang sicp
(define (or-gate a1 a2 output)
  (let ((w1 (make-wire))
        (w2 (make-wire))
        (w3 (make-wire)))
    (inverter a1 w1)
    (inverter a2 w2)
    (and-gate w1 w2 w3)
    (inverter w3 output)
    'ok))

;delay = 2 * invertor-delay + and-delay