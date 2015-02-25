#lang scribble/manual

@title{exact-decimal meta-language}

source code: @url["https://github.com/AlexKnauth/exact-decimal-lang"]

@defmodulelang[exact-decimal]{
The @racketmodname[exact-decimal] language is a meta-language like @racketmodname[at-exp]
that reads decimals as exact rationals. 

For example, @racket[@#,hash-lang[] @#,racketmodname[exact-decimal] @#,racketmodname[racket/base]]
is a language like @racketmodname[racket/base], except that for example
@racket[0.1] reads as @racket[1/10].  You can still specify inexact numbers with
@litchar{#i} though.

@racketmod[exact-decimal @#,racketmodname[racket/base]
0.1]
produces @racket[1/10]
}
