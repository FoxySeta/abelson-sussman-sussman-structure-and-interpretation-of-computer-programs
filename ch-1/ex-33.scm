; Exercise 1.33. You can obtain an even more general version of accumulate
; (exercise 1.32) by introducing the notion of a filter on the terms to be
; combined. That is, combine only those terms derived from values in the range
; that satisfy a specified condition. The resulting filtered-accumulate
; abstraction takes the same arguments as accumulate, together with an
; additional predicate of one argument that specifies the filter. Write
; filtered-accumulate as a procedure.

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                             (filtered-accumulate combiner
                                                  null-value
                                                  term
                                                  (next a)
                                                  next
                                                  b
                                                  filter)))
        (else (filtered-accumulate combiner
                                   null-value
                                   term
                                   (next a)
                                   next
                                   b
                                   filter))))

; Show how to express the following using filtered-accumulate:
; a. the sum of the squares of the prime numbers in the interval a to b
; (assuming that you have a prime? predicate already written)

(define (next x)
  (+ x 1))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (sum-squares-of-primes a b)
  (filtered-accumulate + 0 square a next b prime?))

; b. the product of all the positive integers less than n that are relatively
; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (identity x) x)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (multiply-relative-primes n)
  (define (relative-prime? x)
    (= (gcd n x) 1))
  (filtered-accumulate * 1 identity 2 next (- n 1) relative-prime?))
