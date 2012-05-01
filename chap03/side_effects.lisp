
; The push and pop functions have side effects >:(

(setf a '())

(push 'a a)
(push 'b a)
(push 'c a)

(print a) ; (c b a)

(print (pop a)) ; c
(print (pop a)) ; b
(print (pop a)) ; a
(print (pop a)) ; nil

(print a) ; nil

; So as incf and decf

(setf a 1)

(print a)
(incf a)
(print a)
