

(let* ((x 6) (y (* x x)))
	(print (+ x y)) )


; 3.1 - Show a lambda equivalent to the above let* expression
((lambda(x) 
	(print 
		(+ x ((lambda() (* x x)))) ) ) 6)
