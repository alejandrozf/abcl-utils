;;;; package.lisp

(defpackage #:abcl-utils
  (:use #:cl)
  (:export
   #:bytes->unicode-java-string
   #:bytes->unicode-lisp-string
   #:lisp-string->java-bytes
   #:lisp-string->lisp-bytes
   #:codepoint->unicode-lisp-string
   #:codepoint->name
   #:name->codepoint
   #:debug))
