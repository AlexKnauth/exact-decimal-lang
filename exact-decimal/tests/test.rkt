#lang exact-decimal racket

(require rackunit)

(check-equal? 0.1 1/10)
(check-equal? (+ .1 .1 .1 .1 .1 .1 .1 .1) .8)
(check-equal? (for/sum ([i 8]) .1) .8)
(check-equal? (for/list ([i (in-range .1 .8 .1)]) i)
              (for/list ([i (in-range 1/10 8/10 1/10)]) i))
