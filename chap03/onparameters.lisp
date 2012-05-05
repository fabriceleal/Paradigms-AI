

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

; find-all moved to appendix, imported here for backward compability :P
(load "../appendix/find-all.lisp")
