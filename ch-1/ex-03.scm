; Exercise 1.3. Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.

(define (max a b)
        (if (> a b)
        a
        b))

(define (middle a b c)
        (if (> a b)
            (if (> a c)
                (max b c)
                a)
            (if (> b c)
                (max a c)
                b)))

(define (square a)
        (* a a))

(define (f a b c)
        (+ square (max (max a
                            b)
                        c)
           square (middle a
                          b
                          c)))

