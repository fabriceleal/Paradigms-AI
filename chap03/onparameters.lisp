

;; "Regular"
;(defun math-quiz (op range n)
;; With optionals:
;(defun math-quiz (&optional (op '+) (range 100) (n 10))
;; Key'ed
(defun math-quiz (&key (op '+) (range 100) (n 10))
	"Asks a series of math problems."
	(dotimes (i n)
		(problem (random range) op (random range)) ) )

(defun problem (x op y)
	"Asks a math problem, read a reply, and say if it's correct"
	(format t "How much is ~d ~a ~d?" x op y)
	(if (eql (read) (funcall op x y)) 
		(princ "Correct!")
		(princ "Sorry, that's not right!") ) )


; &rest - accumulates all the keyword-value pairs in keyword-args
; are specified two specific keyword pars, :test and :test-not
; if you have &key and want other keywords, you'll have to add &allow-other-keys

; The call to remove will contain 2 :test keywords, but it's ok;
; Common Lisp declares that the leftmost value is the one that counts ;)
(defun find-all (item seq &rest keyword-args &key (test #'eql) test-not &allow-other-keys)
	(if test-not
		(apply #'remove item seq
			:test-not (complement test-not) keyword-args)
		(apply #'remove item seq
			:test (complement test) keyword-args) ) )
