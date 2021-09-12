#lang racket
(define (make-account balance secret-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Недостаточно денег на счете"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                       m))))
  (define (deco-pass m pass)
    (if (eq? pass secret-password)
        (dispatch m)
        (error "wrong password")))
  deco-pass)

(define (make-joint account1 password1 password2)
  (define (enter op password)
    (if (eq? password password1)
        (account1 op password2)
        (error "wrong password")))
  enter)


(define peter-acc (make-account 100 'wtf))
((peter-acc 'withdraw 'wtf) 5)
((peter-acc 'deposit 'wtf) 10)

(define paul-acc
  (make-joint peter-acc 'open-sesame 'wtf))
((paul-acc 'withdraw 'open-sesame) 33)
((paul-acc 'withdraw 'asd) 20)
((peter-acc 'deposit 'kfg) 3)
