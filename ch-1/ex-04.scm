; Exercise 1.4. Observe that our model of evaluation allows for combinations
; whose operators are compound expressions. Use this observation to describe the
; behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; The result is the sum between a and b if b is positive, or their difference if
; b is not. De facto, a + | b| is computed, as the name of the procedure
; suggests.
