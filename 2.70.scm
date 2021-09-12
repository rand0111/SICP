#lang racket
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
  
(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "плохой бит -- CHOOSE-BRANCH" bit))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))


(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol char tree)
  (define (encode-leaf char leaf)
    (if (eq? char (symbol-leaf leaf))
        0
        #f))
  (define (encode-last-leaf char tree)
    (if (eq? (encode-leaf char tree) 0)
        (list)
        (error "not such symbol" char)))
 (cond ((leaf? tree) (encode-last-leaf char tree))
        ((not (leaf? tree))
         (if (eq? (encode-leaf char (left-branch tree)) 0)
             (list 0)
             (cons 1 (encode-symbol char (right-branch tree)))))
        (else (error "data structure error" tree))))

 (define (successive-merge leafset) 
   (if (null? (cdr leafset)) 
         leafset
         (cons (car leafset) (successive-merge (cdr leafset)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define input '((a 2) (boom 1) (get 2) (job 2) (na 16) (sha 3) (yip 9) (wah 1)))
(define h-tree (generate-huffman-tree input))
(define words '(get a job
  sha na na na na na na na na
  get a job
  sha na na na na na na na na
  wah yip yip yip yip yip yip yip yip yip
  sha boom))
(successive-merge (make-leaf-set input))
;(encode words h-tree)

  