; Exercise 1.29. Simpson's Rule is a more accurate method of numerical
; integration than the method illustrated above. Using Simpson's Rule, the
; integral of a function f between a and b is approximated as
; h/3(y_0 + 4y_1 + 2y_2 + 4y_3 + 2y_4 + ... + 2y_{n - 2} + 4y_{n - 1} + y_n)
; where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing
; n increases the accuracy of the approximation.) Define a procedure that takes
; as arguments f, a, b, and n and returns the value of the integral, computed
; using Simpson's Rule. Use your procedure to integrate cube between 0 and 1
; (with n = 100 and n = 1000), and compare the results to those of the integral
; procedure shown above.

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (next x) (+ x 1))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term x)
    (* (cond ((or (= x 0) (= x b)) 1)
             ((even? x) 2)
             (else 4))
       (f (+ a (* x h)))))
  (* (/ h 3) (sum simpson-term 0 next n)))

(simpson cube 0 1 100.0) ; 0.25333332333333325
(simpson cube 0 1 1000.0) ; 0.2503333333323336
