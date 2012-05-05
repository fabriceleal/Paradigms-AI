
(defvar *dbg-ids* nil "Identifiers used by dbg")

(defun dbg (id format-string &rest args)
	"Print debugging info if (DEBUG id) has been specified"
	(when (member id *dbg-ids*)
		(fresh-line *debug-io*)
		(apply #'format *debug-io* format-string args) ) )

(defun debug (&rest ids)
	"Start dbg output on the given ids."
	(setf *dbg-ids* (union ids *dbg-ids*)) )

(defun undebug (&rest ids)
	"Stop dbg on the ids. With no ids, stop dbg altogether."
	(setf *dbg-ids* 
		(if (null ids) nil 
		    (set-difference *dbg-ids* ids) ) ) )

(defun dbg-indent (id indent format-string &rest args)
	"Print indented debugging info if (DEBUG id) has been specified."
	(when (member id *dbg-ids*)
		(fresh-line *debug-io*)
		(dotimes (i indent) (princ " " *debug-info*))
		(apply #'format *debug-io* format-string args) ) )


