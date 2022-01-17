# abcl-utils

Some utility functions to help in the day to day with ABCL Common Lisp

Maybe can be useful for someone else

I probably will add more if possible later ...


Quickstart

Clone this repository to your Quicklisp local-projects folder:

CL-USER> (ql:quickload :abcl-utils)

CL-USER> (abcl-utils:bytes->utf-8 '(#xf0 #x9f #x91 #x8c))

#<java.lang.String 👌 {6CEAE0DF}>

CL-USER> (abcl-utils:print-bytes-utf-8-console '(#xf0 #x9f #x91 #x8c))

"👌"

CL-USER>

There is also abcl-utils:debug which can help to inspect variables contents in Slime/Sly

Tested on OpenJDK 11 & ABCL 1.8

## License

MIT
