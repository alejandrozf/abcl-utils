;;;; abcl-utils.lisp

(in-package #:abcl-utils)

(defun bytes->unicode-java-string (byte-list encoding)
  "Converts a list of bytes in to a Lisp Unicode string according
  to the encoding selected"
  ;; (bytes->unicode-java-string '(#xf0 #x9f #x91 #x8c) "UTF_8") --> #<java.lang.String 👌 {4477DBA0}>
  (java:jnew "java.lang.String" (java:jnew-array-from-list "byte" byte-list)
        (java:jfield "java.nio.charset.StandardCharsets" encoding)))

(defun bytes->unicode-lisp-string (byte-list encoding)
  "Converts a list of bytes in to a Lisp Unicode string according
  to the encoding selected"
  ;; (bytes->unicode-lisp-string '(#xf0 #x9f #x91 #x8c) "UTF_8") --> "👌"
  (let ((method (java:jmethod "java.lang.String" "toString")))
    (java:jcall method (bytes->unicode-java-string byte-list encoding))))

(defun lisp-string->java-bytes (string encoding)
  "Coverts an ABCL string to a Java array of octets according to the selected encoding"
  ;; (lisp-string->java-bytes "👌dfsfd" "UTF32") --> #<jarray [B@53c4b0ed {4079E4B5}>
  (let ((get-bytes-method (java:jmethod "java.lang.String" "getBytes" "java.lang.String")))
    (java:jcall get-bytes-method string encoding)))

(defun lisp-string->lisp-bytes (string encoding)
  "Coverts an ABCL string to a list of octets according to the selected encoding"
  ;; (lisp-string->lisp-bytes "👌" "UTF16") --> (254 255 216 61 220 76)
  (let ((res ())
        (jarray (lisp-string->java-bytes string encoding)))
    (dotimes (i (java:jarray-length jarray) (nreverse res))
      (push (logand (java:jarray-ref jarray i) #xff) res))))

(defun debug (&rest args)
  "Helps to show variables inside debugger"
  ;; (debug var1 var2 ...)
  ;; In Sly this show the vars
  (declare (ignore args))
  (break))
