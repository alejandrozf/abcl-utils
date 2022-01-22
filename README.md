# abcl-utils

Some utility functions to help in the day to day with ABCL Common Lisp

Maybe can be useful for someone else

I probably will add more if possible later ...


Quickstart

Clone this repository to your Quicklisp local-projects folder:

CL-USER> (ql:quickload :abcl-utils)

ABCL-UTILS> (bytes->unicode-java-string '(#xf0 #x9f #x91 #x8c) "UTF_8")

#<java.lang.String 👌 {7C1607EB}>

ABCL-UTILS> (bytes->unicode-lisp-string '(#xf0 #x9f #x91 #x8c) "UTF_8")

"👌"

ABCL-UTILS> (lisp-string->java-bytes "👌dfsfd" "UTF32")

#<jarray [B@30006baf {4635F69A}>

ABCL-UTILS> (lisp-string->lisp-bytes "👌" "UTF16")

(254 255 216 61 220 76)

ABCL-UTILS>

There is also abcl-utils:debug which can help to inspect variables contents in Slime/Sly

Tested on OpenJDK 11 & ABCL 1.8

## License

MIT
