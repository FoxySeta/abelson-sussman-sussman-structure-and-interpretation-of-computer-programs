; Exercise 1.31.  
; a. The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures.51 Write an
; analogous procedure called product that returns the product of the values of
; a function at points over a given range. Show how to define factorial in terms
; of product. Also use product to compute approximations to  using the formula
; \pi / 4 = (2/3)(4/3)(4/5)(6/5)(6/7)(8/7)...

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (even? x) (= (remainder x 2) 0))

(define (next x) (+ x 1))

(define (pi-approximation n)
  (define (pi-term x) ; assuming x >= 2
    (if (even? x)
      (/ x (+ x 1))
      (/ (+ x 1) x)))
  (product pi-term 2.0 next (+ n 1)))

; b. If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

(define (product-iter term a next b)
  (define (iter a result) ; a = current, result = sum of the previous terms
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
