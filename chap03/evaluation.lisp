
(print (+ 1 2 3 4))
(print (funcall #'+ 1 2 3 4))
(print (apply #'+ '(1 2 3 4)))
(print (apply #'+ 1 2 '(3 4)))
(print (eval '(+ 1 2 3 4)))
