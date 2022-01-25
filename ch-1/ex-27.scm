; Exercise 1.27. Demonstrate that the Carmichael numbers listed in footnote 47
; really do fool the Fermat test. That is, write a procedure that takes an
; integer n and tests whether a^n is congruent to a modulo n for every a<n, and
; try your procedure on the given Carmichael numbers.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (complete-fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (aux a n) ; assuming a < n
    (cond ((>= a n) #t)
          ((try-it a) (aux (+ a 1) n))
          (else #f)))
  (aux 2 n))

(complete-fermat-test 561)
(complete-fermat-test 1105)
(complete-fermat-test 1729)
(complete-fermat-test 2465)
(complete-fermat-test 2821)
(complete-fermat-test 6601)
