(uiop:define-package #:chiputils
  (:nicknames #:c)
  (:use #:cl #:alexandria #:yason #:arrow-macros)
  (:export #:read-json-file
           #:sassoc
           #:group
           #:dump-output
           #:with-interned-symbols
           #:->
           #:->>))
