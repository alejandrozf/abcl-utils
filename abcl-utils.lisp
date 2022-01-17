;;;; abcl-utils.lisp

(in-package #:abcl-utils)

(defun bytes->utf-8 (byte-list)
  "Converts a list of bytes to a Java UTF-8 string"
  ;; (bytes->utf-8 '(#xf0 #x9f #x91 #x8c)) --> #<java.lang.String 👌 {4477DBA0}>
  (java:jnew "java.lang.String" (java:jnew-array-from-list "byte" byte-list)
        (java:jfield "java.nio.charset.StandardCharsets" "UTF_8")))

(defun print-bytes-utf-8-console (byte-list)
  "Prints a list of bytes in the console as UTF-8 string"
  ;; (print-bytes-utf-8-console '(#xf0 #x9f #x91 #x8c)) --> "👌"
  (let ((method (java:jmethod "java.lang.String" "toString")))
    (java:jcall method (bytes->utf-8 byte-list))))

(defun debug (&rest args)
  "Helps to show variables inside debugger"
  ;; (debug var1 var2 ...)
  ;; In Sly this show the vars
  (declare (ignore args))
  (break))
