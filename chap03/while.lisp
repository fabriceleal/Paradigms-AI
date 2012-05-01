; A while macro
(defmacro while (test &rest body) 
	"Repeat body while test is true"
	(list* 'loop
		(list 'unless test '(return nil))
		body) )

; Cleaner implementation:
(defmacro while (test &rest body)
	"Repeat body while test is true"
	(let ((code '(loop (unless test (return nil)) . body))) ; the "template"
		; replace symbols ("named vars") with actual vars
		(subst test 'test (subst body 'body code)) ) )

; An even cleaner implementation
(defmacro while (test &rest body)
	"Repeat body while test is true"
	`(loop (unless ,test (return nil))
		,@body) )

; Check the diference between:
;   `(a ,@(list 'b 'c 'd)) => (a b c d)
; and
;   `(a ,(list 'b 'c 'd)) => (a (b c d))

