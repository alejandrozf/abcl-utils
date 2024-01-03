;;;; abcl-utils.lisp

(in-package #:abcl-utils)

(defun bytes->unicode-java-string (byte-list encoding)
  "Converts a list of bytes in to a Lisp Unicode string according
  to the encoding selected"
  ;; (bytes->unicode-java-string '(#xf0 #x9f #x91 #x8c) "UTF8") --> #<java.lang.String 👌 {4477DBA0}>
  (let* ((for-name-method (java:jmethod  "java.nio.charset.Charset"
                                          "forName" "java.lang.String"))
         (charset (java:jstatic for-name-method "java.nio.charset.Charset" encoding))
         (jarray (java:jnew-array-from-list "byte" byte-list)))
    (java:jnew "java.lang.String" jarray charset)))

(defun bytes->unicode-lisp-string (byte-list encoding)
  "Converts a list of bytes in to a Lisp Unicode string according
  to the encoding selected"
  ;; (bytes->unicode-lisp-string '(#xf0 #x9f #x91 #x8c) "UTF8") --> "👌"
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

(defun codepoint->unicode-lisp-string (codepoint)
  "Converts from a codepoint "
  (java:jstatic (java:jmethod "java.lang.Character" "toString" "int")
                "java.lang.Character" codepoint))

(defun codepoint->name (codepoint)
  (java:jstatic (java:jmethod "java.lang.Character" "getName" "int")
                "java.lang.Character" codepoint))

(defun name->codepoint (name)
  (java:jstatic "codePointOf" "java.lang.Character" name))

(defun debug (&rest args)
  "Helps to show variables inside debugger"
  ;; (debug var1 var2 ...)
  ;; In Sly this show the vars
  (declare (ignore args))
  (break))
