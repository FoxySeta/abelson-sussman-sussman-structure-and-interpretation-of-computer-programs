; Exercise 1.25. Alyssa P. Hacker complains that we went to a lot of extra work
; in writing expmod. After all, she says, since we already know how to compute
; exponentials, we could have simply written

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; Is she correct? Would this procedure serve as well for our fast prime tester?
; Explain.

; The original expmod implementation re-applies 'remainder' each step, which
; makes it easier to prevent overflow errors.
