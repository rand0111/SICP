(define (f n) 
  (if (< n 3) n
      (+ (f(- n 1))
         (f(- n 2))
         (f(- n 3)))))

(f 7)

(define (fi n)
  (if (< n 3) n
             (f-iter 1 2 3 n)))

(define (f-iter a b c count)
  (if (= count 1) 
      a
      (f-iter b c (+ a b c) (- count 1))))

(fi 7) 

