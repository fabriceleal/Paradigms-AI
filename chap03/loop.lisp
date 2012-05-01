; The loop construct is a language by itself.

(defun length4 (lst)
	(loop for elem in lst ; for each element ..
		count t) )     ; ... count

(defun length5 (lst)
	(loop for elem in lst ; for each element ...
		summing 1) )  ; add 1

; Well, this throws a warning "LOOP: FOR clauses should occur before the loop's main body",
; however, placing the "do" before the "for" didn't change a thing
; This returns -1 elem.
; Placing the "until" after the "do" solved the warning and the logic error.
(defun length6 (lst)
	(loop 	with len = 0            ; init len with 0
		;until (null lst)        ; do unitl lst is null
		for elem = (pop lst)    ; each elem will be pop'ed from lst
		do (incf len)
		until (null lst)
		finally (return len) ) ); at the end, return len

