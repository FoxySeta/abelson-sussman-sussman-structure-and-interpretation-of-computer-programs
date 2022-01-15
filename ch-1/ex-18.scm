; Exercise 1.18. Using the results of exercises 1.16 and 1.17, devise a
; procedure that generates an iterative process for multiplying two integers in
; terms of adding, doubling, and halving and uses a logarithmic number of steps.

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

; assuming n is an integer
(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

; assuming n is a natural number
(define (fast-mult-iter a b)
  (define (aux a b c)
    (cond ((= b 0) c)
          ((even? b) (aux (double a) (halve b) c))
          (else (aux a (- b 1) (+ c a))))) ; uneven b
  (aux a b 0))
