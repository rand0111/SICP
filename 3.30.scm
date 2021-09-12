#lang sicp
(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    ’ok))

(define (riple-caryy-adder Ak Bk Sk c)
  (define (last? Ak)
    (null? (cdr Ak)))
  (define (rc-adder-iter Ak Bk Sk c-in c-out)
    (if (null? Ak)
        'ok
        (full-adder (car Ak) (car Bk) c-in (car Sk) c-out)
        (rc-adder-iter (cdr Ak) (cdr Bk) (cdr Sk) c-out (make-wire))))
  (if (and (= (length Ak) (length Bk)) (length Sk) (length Bk))
      (let ((c-init (make-wire))
            (sum (make-wire)))
        (rc-adder-iter Ak Bk Sk c-init sum))
      (error "differend initial size")))

	
 
  (define (ripple-adder-iter as bs ss ic-in ic-out)
    (if (null? as)
        'ok
        (full-adder (car as)
                    (car bs)
                    c-in
                    (car ss)
                    (if (last-bit? as) c-out ic-out))
        (ripple-adder-iter (cdr as)
                           (cdr bs)
                           (cdr ss)
                           ic-out
                           (make-wire))))
 
  (if (and (= (length as) (length bs))
           (= (length bs) (length ss)))
      (let ((c-in (make-wire))
            (sum (make-wire)))
        (ripple-adder-iter as bs ss initial-in sum))
      (error "Inputs length must be the same size -- RIPPLE-ADDER"
             (length as)
             (length bs)
             (length ss))))