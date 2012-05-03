
; round returns 2 values. To grab the both of them,
; use (multiple-value-bind ...)
(defun show-round (x)
	(multiple-value-bind (int remn)
		(round x)
		(format t "~f = ~d + ~f" x int remn)))


(defun onetwothree ()
	(values 1 2 3))
