
; Lexical vars vs Dynamic vars

(setf a 'global-a)
(defvar *b* 'global-b)
(defun fn() *b*)
(let ((a 'local-a) (*b* 'local-b)) 
	(list a *b* (fn) (symbol-value 'a) (symbol-value '*b*)) )

