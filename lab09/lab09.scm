;; Scheme ;;

; Q2
(define (over-or-under x y)
  (if (= x y) 0 (if (< x y) (- 1) (if (> x y) 1)))
)

;;; Tests
(over-or-under 1 2)
; expect -1
(over-or-under 2 1)
; expect 1
(over-or-under 1 1)
; expect 0

; Q3
(define (filter f lst)
  (if (null? lst)
    '()
    (if (f (car lst))
        (cons (car lst) (filter f (cdr lst) ) )
        (filter f (cdr lst))
    )
  )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter even? '(0 1 1 2 3 5 8))
; expect (0 2 8)

; Q4
(define (make-adder num)
  (define (make-adder2 num2)
    (+ num num2)
  )
  make-adder2
)

;;; Tests
(define adder (make-adder 5))
(adder 8)
; expect 13
