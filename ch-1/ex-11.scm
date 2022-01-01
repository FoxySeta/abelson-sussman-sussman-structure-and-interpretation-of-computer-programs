; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that
; computes f by means of a recursive process. Write a procedure that computes f
; by means of an iterative process.

(define (f-recursive n) ; assuming n is a natural number
  (if (< n 3)
    n
    (+ (f-recursive (- n
             1))
       (* 2
          (f-recursive (- n
                2)))
       (* 3
          (f-recursive (- n
                3))))))

(define (f-iterative n) ; assuming n is a natural number
  (define (aux a b c count)
    (if (< count 3)
      c
      (aux b
           c
           (+ c
              (* 2 b)
              (* 3 a))
           (- count 1))))
  (if (< n 3)
    n
    (aux 0 1 2 n)))

(define (test n)
  (if (< n 0)
    #t
    (and (= (f-recursive n)
            (f-iterative n))
         (test (- n 1)))))
