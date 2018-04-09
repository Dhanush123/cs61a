(define (find s predicate)
  	(if (null? s) #f
  	  	(if (predicate (car s)) (car s)
  	      	(find (cdr-stream s) predicate)
  	  	)
  	)
)

(define (scale-stream s k)
  (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k))
)

(define (has-cycle s)
	(define (helper larger smaller)
  		(cond
   			((null? smaller) #f)
   			((null? (cdr-stream smaller)) #f)
   			((eq? larger smaller) #t)
   			(else (helper (cdr-stream larger) (cdr-stream (cdr-stream smaller))))
   		)
   	)
	(if (null? s) #f
		(helper s (cdr-stream s))
	)
)


(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
