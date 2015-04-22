(module reader racket/base
  (require syntax/module-reader)
  
  (provide (rename-out [exact-decimal-read read]
                       [exact-decimal-read-syntax read-syntax]
                       [exact-decimal-get-info get-info]))
  
  (define-values (exact-decimal-read exact-decimal-read-syntax exact-decimal-get-info)
    (make-meta-reader
     'exact-decimal
     "language path"
     (lambda (bstr)
       (let* ([str (bytes->string/latin-1 bstr)]
              [sym (string->symbol str)])
         (and (module-path? sym)
              (vector
               ;; try submod first:
               `(submod ,sym reader)
               ;; fall back to /lang/reader:
               (string->symbol (string-append str "/lang/reader"))))))
     (lambda (orig-read)
       (define (read . args)
         (parameterize ([read-decimal-as-inexact #f])
           (apply orig-read args)))
       read)
     (lambda (orig-read-syntax)
       (define (read-syntax . args)
         (parameterize ([read-decimal-as-inexact #f])
           (define stx (apply read-syntax args))
           (define old-prop (syntax-property stx 'module-language))
           (define new-prop `#(exact-decimal/lang/language-info get-language-info ,old-prop))
           (syntax-property stx 'module-language new-prop)))
       read-syntax)
     (lambda (proc) proc))))
