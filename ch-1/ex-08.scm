; Exercise 1.8.  Newton's method for cube roots is based on the fact that if y
; is an approximation to the cube root of x, then a better approximation is
; given by the value (x/y^2 + 2y)/3. Use this formula to implement a cube-root
; procedure analogous to the square-root procedure. (In section 1.3.4 we will
; see how to implement Newton's method in general as an abstraction of these
; square-root and cube-root procedures.)

(define (square x)
  (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2
           guess))
     3))

(define tolerance 0.001)

(define (good-enough? old-guess guess)
  (< (abs (/ (- guess old-guess)
             guess)) tolerance))

(define (cubert-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (cubert-iter guess
                 (improve guess x)
                 x)))

(define initial-guess 1.0)

(define (cubert x)
  (cubert-iter (* 2 initial-guess) initial-guess x))
