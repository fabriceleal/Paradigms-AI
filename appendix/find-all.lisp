
; &rest - accumulates all the keyword-value pairs in keyword-args
; are specified two specific keyword pars, :test and :test-not
; if you have &key and want other keywords, you'll have to add &allow-other-keys

; The call to remove will contain 2 :test keywords, but it's ok;
; Common Lisp declares that the leftmost value is the one that counts ;)
(defun find-all (item seq &rest keyword-args &key (test #'eql) test-not &allow-other-keys)
        (if test-not
                (apply #'remove item seq
                        :test-not (complement test-not) keyword-args)
                (apply #'remove item seq
                        :test (complement test) keyword-args) ) )

