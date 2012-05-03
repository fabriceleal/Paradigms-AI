
; apropos: prints information about all objects whose names match the argument
; (apropos 'string)

; describe: prints information about an object
; (describe 'make-string)
; (describe 17)

; documentation: prints the symbol's doc string
; (documentation 'first 'function)
; (documentation 'pi 'variable)

; inspect: ...

; Drastic average (error ...)
(defun drastic-average(numbers)
	(if (null numbers)
		(error "Average of the empty list is undefined.")
		(/ (reduce #'+ numbers)
			(length numbers) ) ) )

; Less-drastic average (cerror ...)
(defun cool-average (numbers)
	(if (null numbers)
		(progn
			(cerror "Use 0 as the average"
				"Average of the empty list is undefined") 
			0)
		(/ (reduce #'+ numbers) (length numbers)) ) )

; Usage of (check-type ...)
(defun sqr-check-type (x)
	"Multiply x by itself"
	(check-type x number)
	(* x x))

; Usage of (assert ...)
(defun sqr-assert (x)
	"Multiply x by itself."
	(assert (numberp x))
	(* x x))

; Usage of (time ...): interpreted vs compiled

(defun f(n) (dotimes (i n) nil))
(time (f 1000))
(compile 'f)
(time (f 1000))

