
(defun simple-equal (x y)
	"Are x and y equal? (Don't check inside strings)"
	(if (or (atom x) (atom y))
		(eql x y)
		(and 	(simple-equal (first x) (first y))
			(simple-equal (rest x) (rest y)) ) ) )

(defun pat-match (pattern input)
	"Does pattern match input? Any variable can match anything."
	(if (variable-p pattern)
		(list (cons pattern input))
		(if (or (atom pattern) (atom input)) 
			(eql pattern input)
			(append
				(pat-match (first pattern) (first input))
				(pat-match (rest pattern) (rest input)) ) ) ) )

(defun variable-p (x)
	"Is x a variable (a symbol beginning with ?)"
	(and (symbolp x) (equal (char (symbol-name x) 0) #\?)) )

