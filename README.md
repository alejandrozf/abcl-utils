# abcl-utils

Some utility functions to help in the day to day with ABCL Common Lisp

Maybe can be useful for someone else

I probably will add more if possible later ...

Quickstart

Clone this repository to your Quicklisp local-projects folder:

```
CL-USER> (ql:quickload :abcl-utils)

CL-USER> (in-package :abcl-utils)

ABCL-UTILS> (defmacro print-var (var)
              `(format t "~% ~a = ~s" ',var ,var))

PRINT-VAR

ABCL-UTILS> (let* ((utf8-bytes '(#xf0 #x9f #x91 #x8c))
                   (java-str-utf8 (bytes->unicode-java-string utf8-bytes "UTF8"))
                   (lisp-str-utf8 (bytes->unicode-lisp-string utf8-bytes "UTF8"))
                   (utf8-bytes-from-str (lisp-string->lisp-bytes lisp-str-utf8 "UTF8"))

                   (utf16-bytes (lisp-string->lisp-bytes lisp-str-utf8 "UTF16"))
                   (utf16-java-str (bytes->unicode-java-string utf16-bytes "UTF16"))
                   (utf16-lisp-str (bytes->unicode-lisp-string utf16-bytes "UTF16"))

                   (utf32-bytes (lisp-string->lisp-bytes lisp-str-utf8 "UTF32"))
                   (utf32-java-str (bytes->unicode-java-string utf32-bytes "UTF32"))
                   (utf32-lisp-str (bytes->unicode-lisp-string utf32-bytes "UTF32")))

              (print-var utf8-bytes)
              (print-var java-str-utf8)
              (print-var lisp-str-utf8)
              (print-var utf8-bytes-from-str)

              (print-var utf16-bytes)
              (print-var utf16-java-str)
              (print-var utf16-lisp-str)

              (print-var utf32-bytes)
              (print-var utf32-java-str)
              (print-var utf32-lisp-str))

UTF8-BYTES = (240 159 145 140)

JAVA-STR-UTF8 = #<java.lang.String 👌 {2274B954}>

LISP-STR-UTF8 = 👌

UTF8-BYTES-FROM-STR = (240 159 145 140)

UTF16-BYTES = (254 255 216 61 220 76)

UTF16-JAVA-STR = #<java.lang.String 👌 {70CE8902}>

UTF16-LISP-STR = 👌

UTF32-BYTES = (0 1 244 76)

UTF32-JAVA-STR = #<java.lang.String 👌 {A69F6B0}>

UTF32-LISP-STR = 👌

NIL

ABCL-UTILS> (codepoint->unicode-lisp-string #xffaf)
"ﾯ"
ABCL-UTILS> (codepoint->name #xffaf)
"HALFWIDTH HANGUL LETTER RIEUL-PHIEUPH"

ABCL-UTILS> (abcl-utils:name->codepoint "BOX DRAWINGS LIGHT HORIZONTAL")
9472
ABCL-UTILS> (defun unicode-converter (stream char)
              (declare (ignore char))
              (code-char (name->codepoint (symbol-name (read stream t nil t)))))
UNICODE-CONVERTER
ABCL-UTILS> (set-macro-character #\? #'unicode-converter)
T
ABCL-UTILS> ?:|BOX DRAWINGS LIGHT HORIZONTAL|
#\─
ABCL-UTILS>
```

There is also abcl-utils:debug which can help to inspect variables contents in Slime/Sly

Tested on OpenJDK 11 & ABCL 1.8

## License

MIT
