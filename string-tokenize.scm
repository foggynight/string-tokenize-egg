;; string-tokenize.scm
;; Copyright (C) 2022 Robert Coffey
;; Released under the MIT license.

(module string-tokenize
  (string-tokenize)

(import scheme
        (chicken base))

;; e.g. (string-tokenize "Hello, World." " " ",.")
;;   => ("Hello" "," "World" ".")
(define (string-tokenize str #!optional (drop " \t\n") (keep ""))
  (define len (string-length str))
  (set! drop (string->list drop))
  (set! keep (string->list keep))

  (define start 0)
  (define (next-token!)
    (let loop ((end start))
      (cond ((= end len)
             (if (= start end)
                 #f
                 (let ((sub (substring str start end)))
                   (set! start end)
                   sub)))
            ((memv (string-ref str end) drop)
             (let ((sub (substring str start end)))
               (set! start (+ end 1))
               sub))
            ((memv (string-ref str end) keep)
             (let ((real-end (if (< start end) end (+ end 1))))
               (let ((sub (substring str start real-end)))
                 (set! start real-end)
                 sub)))
            (else (loop (+ end 1))))))

  (define tokens '())
  (do ((tok (next-token!) (next-token!)))
      ((not tok))
    (when (> (string-length tok) 0)
      (set! tokens (cons tok tokens))))
  (reverse tokens))

) ; module
