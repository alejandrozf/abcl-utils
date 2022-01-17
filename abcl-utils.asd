;;;; abcl-utils.asd

(asdf:defsystem #:abcl-utils
  :description "Some functions utils for ABCL"
  :author "Alejandro Zamora <ale2014.zamora@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "abcl-utils")))
