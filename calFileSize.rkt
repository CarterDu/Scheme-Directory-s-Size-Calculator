
(define disk `("D" "top"      ;data structure of directory
(
	("F" "file1.txt" 30)
	("D" "sub1"
	(
		( "F" "file1.txt" 1234)
		( "F" "file2.txt" 2345)
		( "F" "file3.txt" 3456)
	)
	)
	("D" "sub2"
	(
		( "F" "file1.txt" 1234)
		( "F" "file2.txt" 2345)
		( "F" "file3.txt" 3456)
	)
	)
)
)
)

;calculating the sum size of the current directory
(define (directory dir)
  (processDirectoryContent (caddr dir))
  )


;return the size of the file
;ex: ("F" "fileName" 50)
(define (file f)
  (if (eq? (car f) "F") (caddr f)))
  

(define (processElement lst)
  (if(eq? (car lst) "D")
     (directory lst) ;if lst is type of "directory"
   (file lst)   ;else consider lst as "file"
   )
  )

;sum up size of files in the directory list
(define (processDirectoryContent lst)
  (if(null? lst) 0  ;base case: if no file in directory
     (+ (processElement (car lst)) (processDirectoryContent (cdr lst)))  ;(car lst) is the 1st file in the directory
     )
  )

 (directory disk)






