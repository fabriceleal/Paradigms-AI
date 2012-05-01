
; Struct definition
(defstruct name
	; These are fields:
	first-name
	(middle-name nil) ; This is a field with a default value
	last-name)

; Create a value, and set it to a var
;    the constructor function make-(struct-name) is automatically created.
;    the literal representation of this object is: 
;        #S(name :first-name fabrice :middle-name nil :last-name leal)
;    and the ":middle-name nil" part is optional
(setf b (make-name :first-name 'Fabrice :last-name 'Leal))

; Acessors (struct-name)-(struct-field) are automatically created
(print (name-first-name b))
(print (name-middle-name b))
(print (name-last-name b))

; A type-predicate (struct-name)-p is automatically created
(print (name-p b))

; You can set the value of a field like this
(setf (name-middle-name b) 'Ferreira)

(print b)
