(uiop:define-package #:chiputils
  (:nicknames #:c)
  (:use #:cl #:alexandria #:yason)
  (:export :read-json-file
           :sassoc))
