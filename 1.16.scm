(define (d-exp b n)
  (cl-exp 1 b n))

(define (square x) (* x x))

(define (cl-exp a b counter)
  (if (= counter 0)
      a
      (if (even? counter)
        (cl-exp a (square b) (/ counter 2))
        (cl-exp (* b a) b (- counter 1)))))


(d-exp 2 9)
