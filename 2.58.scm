#lang racket
(define (variable? x) (symbol? x))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (multiplier p) (car p))

(define (multiplicand p)                          
  (if (null? (cdddr p))                              
      (caddr p)                                 
      (make-product (multiplier (car p))     
                    (multiplicand (cddr p)))))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (addend s) (car s))

(define (augend s)
  (if (null? (cdddr s))  
      (caddr s)       
      (make-sum (addend (car s))
                (augend (cddr s)))))    

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (exponentiation? x) (eq? (car x) '**))

(define (make-exponention base power)
  (list base '**  power))

(define (base p) (cadr p))

(define (power p) (caddr p))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))
   
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (power exp) (make-exponention (base exp) (- (power exp) 1)))) 
        (else
         (error "unknown expression type -- DERIV" exp))))
(deriv '(x + (3 * (x + (y + 2)))) 'x)