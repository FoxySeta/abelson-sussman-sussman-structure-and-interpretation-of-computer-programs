; Exercise 1.35. Show that the golden ratio \Phi (section 1.2.2) is a fixed
; point of the transformation x -> 1 + 1/x, and use this fact to compute \Phi by
; means of the fixed-point procedure.

; f(\Phi) = 1 + 1 / \Phi = 1 + 2 / (1 + sqrt(5)) =
; = (3 + sqrt(5)) / (1 + sqrt(5)) = (3 + sqrt(5)) (1 - sqrt(5)) / -4 =
; = (-2 - 2 sqrt(5)) / -4 = (1 + sqrt(5)) / 2 = \Phi

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1.0) ; 1.6180327868852458

