(in-package #:chiputils)

(defun read-json-file (path)
  "Read a json file as an alist."
  (let ((yason:*parse-object-as* :alist))
    (with-open-file (f path)
      (yason:parse f))))

(defun sassoc (item alist)
  "Returns the first cons in `alist` whose car string-equals the item."
  (assoc item alist :test #'string-equal))
