; Exercise 1.13.  Prove that Fib(n) is the closest integer to \phi ^ n /
; / sqrt(5), where \phi = (1 + sqrt(5))/2. Hint: Let \psi = (1 - sqrt(5)) / 2.
; Use induction and the definition of the Fibonacci numbers (see section 1.2.2)
; to prove that Fib(n) = (\phi ^ n - \psi ^ n) / sqrt(5).

; L1: Fib(n) = (\phi ^ n - \psi ^ n) / sqrt(5)
; Using induction over the definition of the Fibonacci numbers.
; - Fib(0) = 0 = (\phi ^ 0 - \psi ^ 0) / sqrt(5)
; - Let us assume Fib(n) = (\phi ^ n - \psi ^ n) / sqrt(5) (IH0),
;   Fib(n + 1) = (\phi ^ (n + 1) - \psi ^ (n + 1)) / sqrt(5) (IH1) and show that
;   Fib(n + 2) = Fib(n) + Fib(n + 1) = (\phi ^ (n + 2) - \psi ^ (n + 2)) /
;   / sqrt(5). [...]
; So it is always true that Fib(n) = (\phi ^ n - \psi ^ n) / sqrt(5).
;
; Let n be a natural number. Then the distance between its Fibonacci number and
; \phi ^ n / sqrt(5), according to L1, is d(n) = |\psi| ^ n / sqrt(5) =
; = ((sqrt(5) - 1) / 2) ^ n / sqrt(5) = 0.??? ^ n / sqrt(5). This exponential
; function is smaller than 0.5 for any natural n. In other words, n is the
; best integer approximation of \phi ^ n / sqrt(5).
