exact-decimal-lang [![Build Status](https://travis-ci.org/AlexKnauth/exact-decimal-lang.png?branch=master)](https://travis-ci.org/AlexKnauth/exact-decimal-lang)
===
a racket lang-extension that reads decimals as exact rationals

documentation: http://pkg-build.racket-lang.org/doc/exact-decimal-lang/index.html

`raco pkg install exact-decimal-lang`

For example, `#lang exact-decimal racket/base` is a language like `racket/base`, except that
decimals like `0.1` read as exact rationals, in this case `1/10`. 
You can still specify inexact numbers with `#i` though.

```racket
#lang exact-decimal racket/base
0.1
```
produces `1/10`
