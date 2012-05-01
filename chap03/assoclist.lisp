; *******************
; a(ssociation lists)-list
(setf country-table 
	'((PT . Portugal) (ES . Spain) (CH . Switzerland) (UK . UnitedKingdom)) )

; Retrieve key-value by key
(print (assoc 'PT country-table))

; Retrive value by key
(print (cdr (assoc 'PT country-table)))

; This will print NIL
(print (assoc 'IR country-table))

; Retrieve key-value by value
(print (rassoc 'Portugal country-table))

; Retrieve key by value
(print (car (rassoc 'Portugal country-table)))

; *********************
; .. or you could use a hash-table :)

(setf country-table (make-hash-table))

(setf (gethash 'PT country-table) 'Portugal)
(setf (gethash 'ES country-table) 'Spain)
(setf (gethash 'CH country-table) 'Switzerland)
(setf (gethash 'UK country-table) 'UnitedKingdom)

; Retrieve value by key
(print (gethash 'PT country-table))

; *********************
; ... p(roperty) lists:
(setf (get 'PT 'country-table) 'Portugal)
(setf (get 'ES 'country-table) 'Spain)
(setf (get 'CH 'country-table) 'Switzerland)
(setf (get 'UK 'country-table) 'UnitedKingdom)

; Retrieve value by key
(print (get 'PT 'country-table))


