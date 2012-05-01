; This:
(defun length9 (lst)
	(if (null lst)
		0
		(+ 1 (length9 (rest lst))) ) )


; is way worse than this:
(defun length10 (lst)
	(length10-aux lst 0) )


(defun length10-aux (lst len)
	(if (null lst)
		len
		(length10-aux (rest lst) (+ 1 len)) ) )
; len is an accumulator

; The important difference is *when* the addition is performed.
; The length10-aux is a tail-recursive function, because the recursive
; call is the last operation that the function does. The last operation
; on length9 is the (+ 1 ...) call. Many compilers will optimize
; tail-recusrive calls.

; The extra ...-aux function can be suppressed with an optional parameter:

(defun length11 (lst &optional (len 0))
	(if (null lst) 
		len
		(length11 (rest lst) (+ 1 len)) ) )

