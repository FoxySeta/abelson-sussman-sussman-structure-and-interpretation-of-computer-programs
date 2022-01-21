; Exercise 1.20.  The process that a procedure generates is of course dependent
; on the rules used by the interpreter. As an example, consider the iterative
; gcd procedure given above. Suppose we were to interpret this procedure using
; normal-order evaluation, as discussed in section 1.1.5. (The
; normal-order-evaluation rule for if is described in exercise 1.5.) Using the
; substitution method (for normal order), illustrate the process generated in
; evaluating (gcd 206 40) and indicate the remainder operations that are
; actually performed. How many remainder operations are actually performed in
; the normal-order evaluation of (gcd 206 40)? In the applicative-order
; evaluation?

; Normal-order-evaluation:
; (gcd 206 40)
; (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
; (if #f 206 (gcd 40 (remainder 206 40)))
; (gcd 40 (remainder 206 40))
; (if (= (remainder 206 40) 0)
;     40
;     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if #f 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if #f 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (if (= (remainder 40 (remainder 206 40)) 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (if (= (remainder 40 6) 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (if (= 4 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (if #f
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (gcd (remainder 40 (remainder 206 40))
;      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (...))))
; (if (= (remainder 6 (remainder 40 6)) 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (...))))
; (if (= (remainder 6 4) 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (...))))
; (if (= 2 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (...))))
; (if #f
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (...))))
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (...))))
; (if (= (remainder (remainder 40 (remainder 206 40))
;                   (remainder (remainder 206 40)
;                              (remainder 40 (remainder 206 40))))
;     0)
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (......))
; (if (= (remainder 4 (remainder 6 4)) 0)
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (......))
; (if (= (remainder 4 2) 0)
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (......))
; (if (= 0 0)
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (......))
; (if #t
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (......))
; (remainder 6 (remainder 40 6))
; (remainder 6 4)
; 2
; Number of remainder operations performed: 16

; Applicative-order evaluation:
; (gcd 206 40)
; (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
; (if #f 206 (gcd 40 (remainder 206 40)))
; (gcd 40 (remainder 206 40))
; (gcd 40 6)
; (if (= 6 0) 40 (gcd 6 (remainder 40 6)))
; (if #f 40 (gcd 6 (remainder 40 6)))
; (if #f 40 (gcd 6 (remainder 40 6)))
; (gcd 6 (remainder 40 6))
; (gcd 6 4)
; (if (= 4 0) 6 (gcd 4 (remainder 6 4)))
; (if #f 6 (gcd 4 (remainder 6 4)))
; (gcd 4 (remainder 6 4))
; (gcd 4 2)
; (if (= 2 0) 4 (gcd 2 (remainder 4 2)))
; (if #f 4 (gcd 2 (remainder 4 2)))
; (gcd 2 (remainder 4 2))
; (gcd 2 0)
; (if (= 0 0) 2 (gcd 0 (remainder 2 0)))
; (if #t 2 (gcd 0 (remainder 2 0)))
; 2
; Number of remainder operations performed: 4
