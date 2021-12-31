; Exercise 1.7. The good-enough? test used in computing square roots will not be
; very effective for finding the square roots of very small numbers. Also, in
; real computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain
; these statements, with examples showing how the test fails for small and large
; numbers. An alternative strategy for implementing good-enough? is to watch how
; guess changes from one iteration to the next and to stop when the change is a
; very small fraction of the guess. Design a square-root procedure that uses
; this kind of end test. Does this work better for small and large numbers?

(define (square x)
  (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; For numbers small enough, the relative error might be very high and yet allow
; the absolute error to be below the predetermined tolerance.

(sqrt 0.0001) ; 0.03230844833048122

; For numbers big enough, even absolute errors greater than the predetermined
; tolerance might be so small that (square guess) and x will be represented as
; the same value in floating point. 

(sqrt 1000000000000000000000000000001) ; 1.0e15

(define tolerance 0.001)

(define (good-enough2? old-guess guess)
  (< (abs (/ (- guess old-guess)
             guess)) tolerance))

(define (sqrt-iter2 old-guess guess x)
  (if (good-enough2? old-guess guess)
      guess
      (sqrt-iter2 guess
                 (improve guess x)
                 x)))

(define initial-guess 1.0)

(define (sqrt2 x)
  (sqrt-iter2 (* 2 initial-guess) initial-guess x))
