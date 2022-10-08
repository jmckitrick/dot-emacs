;;; -*- mode: emacs-lisp; -*-

(eval-when-compile (require 'subr-x))

;; Set up lib path for native compilation.
(setenv "LIBRARY_PATH"
        (string-join
         '("/opt/homebrew/Cellar/gcc/12.2.0/lib/gcc/12/"
           "/opt/homebrew/Cellar/gcc/12.2.0/lib/gcc/12/gcc/aarch64-apple-darwin21/12")
         ":"))
