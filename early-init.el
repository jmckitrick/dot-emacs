;;; -*- mode: emacs-lisp; -*-

(eval-when-compile (require 'subr-x))

;; Set up lib path for native compilation.
(setenv "LIBRARY_PATH"
        (string-join
         '("/usr/local/opt/gcc/lib/gcc/11"
           "/usr/local/opt/libgccjit/lib/gcc/11/"
           "/usr/local/opt/gcc/lib/gcc/11/gcc/x86_64-apple-darwin20/11.2.0")
         ":"))
