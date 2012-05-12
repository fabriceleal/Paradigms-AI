
(defun simple-equal (x y)
	"Are x and y equal? (Don't check inside strings)"
	(if (or (atom x) (atom y))
		(eql x y)
		(and 	(simple-equal (first x) (first y))
			(simple-equal (rest x) (rest y)) ) ) )

;; Some constants

(defconstant fail nil "Indicates pat-match failure")
(defconstant no-bindings '((t . t)) 
	"Indicates pat-match success, with no vars")

;; Abstractions on the bindings list

(defun get-binding (var bindings)
	"Fing a (var . value) pair in a binding list."
	(assoc var bindings) )

(defun binding-val (binding)
	"Get the value part of a single binding."
	(cdr binding) )

(defun lookup (var bindings)
	"Get the value part (for var) from a binding list."
	(binding-val (get-binding var bindings)) )

(defun extend-bindings (var val bindings)
	"Add a (var . val) pair to a binding list."
	(cons (cons var val) 
		(if (eq bindings no-bindings) nil bindings) ) )

;; The pat-match function

(defun pat-match (pattern input &optional (bindings no-bindings))
	"Does pattern match input? Any variable can match anything."
	(cond ((eq bindings fail) fail)
		((variable-p pattern) (match-variable pattern input bindings))
		((eql pattern input) bindings)
		((and (consp pattern) (consp input)) 
			(pat-match (rest pattern) (rest input)
				(pat-match (first pattern) (first input) bindings) ) ) ) )

(defun match-variable (var input bindings)
	"Does var match input? Uses or updates and returns bindings"
	(let ((binding (get-binding var bindings))) 
		(cond ((not binding) (extend-bindings var input bindings))
			((equal input (binding-val binding)) bindings)
			(t fail) ) ) )

(defun variable-p (x)
	"Is x a variable (a symbol beginning with ?)"
	(and (symbolp x) (equal (char (symbol-name x) 0) #\?)) )

