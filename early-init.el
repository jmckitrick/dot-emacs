;;; -*- mode: emacs-lisp; -*-

(eval-when-compile (require 'subr-x))

;; Set up lib path for native compilation.
(setenv "LIBRARY_PATH"
        (string-join
         '("/opt/homebrew/Cellar/gcc/13.1.0/lib/gcc/13/"
           "/opt/homebrew/Cellar/gcc/13.1.0/lib/gcc/13/gcc/aarch64-apple-darwin22/13")
         ":"))
