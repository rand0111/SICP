(define (paskal col row) 
  (if (or (= row col) (= row 1))
      1
      (+ (paskal (- col 1) (- row 1)) (paskal (- col 1) row ))))

(paskal 6 3)