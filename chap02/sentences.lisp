; Iteration 1
(defun random-elt (choices) 
	"Choose an random element from a list of choices"
	(elt choices (random (length choices))) )


(defun one-of (lst) 
	"Create a list with one element, picked at random from a list of choices"
	(list (random-elt lst)) )


(defun sentence()    (append (noun-phrase) (verb-phrase)))
(defun noun-phrase() (append (Article) (Adj*) (Noun) (PP*)))
(defun verb-phrase() (append (Verb) (noun-phrase)))

(defun Article ()    (one-of '(the a)))
(defun Noun()        (one-of '(man ball woman table)))
(defun Verb()        (one-of '(hit took saw liked)))

; Iteration 2

(defun Adj* ()
	(if (= (random 2) 0)
		nil
		(append (Adj) (Adj*)) ) )

(defun PP* ()
	(if (random-elt '(t nil)) 
		(append (PP) (PP*))
		nil) )

(defun PP()   (append (Prep) (noun-phrase)))
(defun Adj()  (one-of '(big little blue green adiabatic)))
(defun Prep() (one-of '(to in by with on)))

