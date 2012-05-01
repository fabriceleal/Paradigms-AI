
; dolist
; (dolist (item-variable list optional-result) body...)

(defun length1 (lst)
	(let  ((len 0)) ; Init counter
		(dolist (elem lst)  ; For each item in list, bind to elem
			(incf len) ) ; Inc by one the length var
		len) ) ; Return elem

; we could have used the result param of dolist, like this:
(defun length1.1 (lst)
	(let ((len 0))
		(dolist (elem lst len) ; The catch is here ...
			(incf len) )
			; ... and not here
		) )

; mapc - applies a function to each elem of the list.
;	 returns the list itself, the function should change
;	 oustide-state to be useful.
; (mapc function list)

(defun length2 (lst)
	(let ((len 0))
		(mapc (lambda(elem) (incf len)) lst) 
		len) )

; dotimes
; (dotimes (variable number optional-result) body...)
; ... not suitable for a length function :-| ...

; do
;  (do ((variable initial next) ...)
;	(exit-test result)
; 	body...)

(defun length3 (lst)
	(do ((len 0 (+ len 1)) ; len, init at zero, inc on each iteration
		(l lst (rest l)) ) ;l, init with lst, cdr' on each iteration
		((null l) len) ; break when l is null, return the len
		; no body!
		) )



