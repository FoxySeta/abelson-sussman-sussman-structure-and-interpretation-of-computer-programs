; Exercise 1.37.
; a. An infinite continued fraction is an expression of the form
; f = N_1 / (D_1 + (N_2 / (D_2 + N_3 / (D_3 + ...
; As an example, one can show that the infinite continued fraction expansion
; with the N_i and the D_i all equal to 1 produces 1/\Phi, where \Phi is the
; golden ratio (described in section 1.2.2). One way to approximate an infinite
; continued fraction is to truncate the expansion after a given number of terms.
; Such a truncation -- a so-called k-term finite continued fraction -- has the
; form
; N_1 / (D_1 + (N_2 / (... + N_K / D_K...)
; Suppose that n and d are procedures of one argument (the term index i) that
; return the N_i and D_i of the terms of the continued fraction. Define a
; procedure cont-frac such that evaluating (cont-frac n d k) computes the value
; of the k-term finite continued fraction. Check your procedure by approximating
; 1/\Phi using
; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            k)
; for successive values of k. How large must you make k in order to get an
; approximation that is accurate to 4 decimal places?

(define (cont-frac n d k)
  (define (aux i)
    (if (= i k)
      (/ (n k) (d k))
      (/ (n i) (+ (d i) (aux (+ i 1))))))
  (aux 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)

; b. If your cont-frac procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

(define (cont-frac-iter n d k)
  (define (aux i w x y z) ; (w + x (...) / y + z (...))
    (if (= i k)
      (let ((frac (/ (n k) (d k))))
        (/ (+ w (* x frac)) (+ y (* z frac))))
      (aux (+ i 1)
           (+ (* w (d i)) (* x (n i)))
           w
           (+ (* y (d i)) (* z (n i)))
           y)))
  (aux 1 0 1 1 0))
