(load "../appendix/mappend.lisp")
(load "sentences.lisp")


(defparameter *simple-grammar*
	'((sentence -> (noun-phrase verb-phrase))
	(noun-phrase -> (Article Noun))
	(verb-phrase -> (Verb noun-phrase))
	(Article -> the a)
	(Noun -> man ball woman table)
	(Verb -> hit took saw liked) )
	"A grammar for a trivial subset of English" )

(defparameter *bigger-grammar*
	'((sentence -> (noun-phrase verb-phrase))
	(noun-phrase -> (Article Adj* Noun PP*) (Name) (Pronoun))
	(verb-phrase -> (Verb noun-phrase PP*))
	(PP* -> () (PP PP*))
	(Adj* -> () (Adj Adj*))
	(PP -> (Prep noun-phrase))
	(Prep -> to in by with on)
	(Adj -> big little blue green adiabatic)
	(Article -> the a)
	(Name -> Pat Kim Lee Terry Robin)
	(Noun -> man ball woman table)
	(Verb -> hit took saw liked)
	(Pronoun -> he she it these those that) ) )

(setf *grammar* *bigger-grammar*)


(defun rule-lhs (rule)
	"The left side of a rule"
	(first rule) )


(defun rule-rhs (rule)
	"The right side of a rule"
	(rest (rest rule)) )


(defun rewrites (category)
	"Return a list of the possible rewrites for this category."
	(rule-rhs (assoc category *grammar*)) )


(defun generate (phrase)
	"Generate a random sentence or phrase."
	(cond ((listp phrase)
		(mappend #'generate phrase) ) 
		;((rewrites phrase)
		; (generate (random-elt (rewrites phrase))) ) 
		;(t (list phrase)) 
		(t (let ((rewrotten (rewrites phrase)))
			(cond 	(rewrotten
				 (generate (random-elt rewrotten)) ) 
				(t (list phrase)) ) )) ) )


