
(defun mappend (fn lst)
	"Applies fn to each element of lst, appending the results"
	(if (null lst) 
		nil
		(append (funcall fn (first lst))
			(mappend fn (rest lst)) ) ) )


