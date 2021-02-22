(asdf:defsystem #:chiputils
  :description "My own Common Lisp utility functions to make life bearable"
  :author "Andreas Arvidsson <andreas@arvidsson.io>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on ("alexandria" "arrow-macros" "yason")
  :components ((:file "package")
               (:file "core")))
