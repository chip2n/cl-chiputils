(in-package #:chiputils)

(defun read-json-file (path)
  "Read a json file as an alist."
  (let ((yason:*parse-object-as* :alist))
    (with-open-file (f path)
      (yason:parse f))))

(defun sassoc (item alist)
  "Returns the first cons in `alist` whose car string-equals the item."
  (assoc item alist :test #'string-equal))

(defun group (source n)
  "Group list into N elements."
  (when (zerop n) (error "zero length"))
  (labels ((rec (source acc)
             (let ((rest (nthcdr n source)))
               (if (consp rest)
                   (rec rest (cons
                              (subseq source 0 n)
                              acc))
                   (nreverse
                    (cons source acc))))))
    (if source (rec source nil) nil)))

(defmacro dump-output ((s path) &body body)
  "Dump output to file"
  `(with-open-file (,s ,path :direction :output
                             :if-does-not-exist :create
                             :if-exists :supersede)
     ,@body))

(defmacro with-interned-symbols (symbol-list &body body)
  "Interns a set of symbols in the current package to variables of the same (symbol-name)."
  (let ((symbol-list (mapcar (lambda (s)
                               (list s `(intern (symbol-name ',s))))
                             symbol-list)))
    `(let ,symbol-list ,@body)))
