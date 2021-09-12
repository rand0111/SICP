(define (d-mult a b)
  (cl-mult 0 a b))

(define (double a ) (* 2 a))

(define (half a) (/ a 2))

(define (cl-mult mult a b)
  (if (= b 0)
    mult
    (if (even? b)
      (cl-mult mult (double a) (half b))
      (cl-mult (+ mult a) a (- b 1)))))

(d-mult 9 1000)