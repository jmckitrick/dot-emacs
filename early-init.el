;;; -*- mode: emacs-lisp; -*-

(eval-when-compile (require 'subr-x))

;; Set up lib path for native compilation.
(setenv "LIBRARY_PATH"
        (string-join
         '("/opt/homebrew/Cellar/gcc/11.3.0_2/lib/gcc/11/"
           "/opt/homebrew/Cellar/libgccjit/11.3.0_2/lib/gcc/11"
           "/opt/homebrew/Cellar/gcc/11.3.0_2/lib/gcc/11/gcc/aarch64-apple-darwin21/11")
         ":"))
